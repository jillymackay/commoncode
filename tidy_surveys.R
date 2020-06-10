library(tidyverse)


survey <- tibble(respondent = c("001", "002", "003"),
                 q1_agree = c(NA, "x", NA),
                 q1_disagree =c("x", NA, "x"),
                 q2_agree = c("x", "x", NA),
                 q2_disagree=c(NA, NA, "x")) 



# Tidied data
tidy_survey <- survey %>% 
  mutate_at(vars(matches("_agree")), .funs = function(x) case_when(!is.na(x) ~ "agree")) %>% 
  mutate_at(vars(matches("disagree")), .funs = function(x) case_when(!is.na(x) ~ "disagree")) %>% 
  mutate(q1 = coalesce(!!! select(., contains("q1"))),
         q2 = coalesce(!!! select(., contains("q2")))) %>% 
  select(respondent, q1, q2)



