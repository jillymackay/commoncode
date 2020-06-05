# Multiple case_whens


library(tidyverse)


dat <- tibble(Grp1 = c("A", "A", "B", "B", "C", "C"),
              Val = c(2,4,4,2,5,4))



dat2 <- dat %>% 
  mutate(Grp3 = case_when(Grp1 == "A" & Val < 3 ~ "A_Low",
                          Grp1 == "B" & Val < 3 ~ "B_Low",
                          Grp1 == "C" & Val < 3 ~ "C_low"),
         Grp3 = case_when(is.na(Grp3) ~ "Other",
                          TRUE ~ as.character(Grp3)))
