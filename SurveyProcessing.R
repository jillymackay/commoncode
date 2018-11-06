
# Recoding Multiple Columns


# Can either create a function like so:

reorder <- function (x) {
  case_when (x == 1 ~ "Disagree",
             x == 2 ~ "Neutral",
             x == 3 ~ "Agree",
             TRUE ~ as.character(x))
}

reorder(1:10)

# and then use mutate_at or mutate_all

d <- d %>%
  mutate_at(.vars = vars (A:D),
            .funs = reorder)

# Or

d <- d %>%
  mutate_at(.vars = vars (A:D),
            .funs = function (x) case_when (x == 1 ~ "Disagree",
                                            x == 2 ~ "Neutral",
                                            x == 3 ~ "Agree",
                                            TRUE ~ as.character(x)))
