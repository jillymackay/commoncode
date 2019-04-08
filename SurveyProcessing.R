
# Recoding Multiple Columns

# Neatest way:
# named vector of level changes
levs <- c("Level1" = "0","Level2" = "1", "Level3" = "2")

dat <- tibble(x1 = c(1,2,1,0,1),
              x2 = c(0,1,2,0,1))

dat %>%
  mutate_at(vars(x1, x2), factor) %>% 
  mutate_at(vars(x1, x2), list(~fct_recode(., !!!levs)))



# Alternatively:

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
