# Likert Package Charts

library(tidyverse)
library(likert)


# Large dataset with long question names

set.seed(2020)

dat <- tibble(q01 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.1, 0.2, 0.65, 0.05)),
              q02 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.1, 0.15, 0.7, 0.05)),
              q03 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.05, 0.1, 0.5, 0.3)),
              q04 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.1, 0.4, 0.1, 0.1)),
              q05 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.1, 0.3, 0.4, 0.1)),
              q06 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.3, 0.6, 0.3, 0.1)),
              q07 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.5, 0.4, 0.2, 0.1)),
              q08 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.6, 0.4, 0.1, 0.05)),
              q09 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                          100, replace = TRUE, prob = c(0.6, 0.2, 0.1, 0.05)),
              q10 = sample(c("Strongly Agree", "Agree", "Disagree", "Strongly Disagree"), 
                           100, replace = TRUE, prob = c(0.8, 0.1, 0.05, 0.05))) %>% 
  mutate_all(parse_factor, levels = c("Strongly Agree",
                                      "Agree",
                                      "Disagree",
                                      "Strongly Disagree"))
  
  
# Create likert object
surveydf <- as.data.frame(dat)


likertall <- likert(items = surveydf[,1:10])

plot(likertall)

# But `plot(likertall)` is too hard to read

# In this case, lets separate out the high and low scoring questions


likertlow <- likert(items = surveydf[, c(1, 2, 3, 5, 6)])
likerthigh <- likert(items = surveydf[, c(4, 7, 9, 8, 10)])


plot(likertlow)
plot(likerthigh)




# And lets say we want to modify aspects of this chart:

plot(likerthigh,
     colors =c("#390E40", "#701C34", 
               "#A63228",  "#C7662A")) +
  theme(legend.position = c(0.8, 0.3)) +
  scale_x_discrete(labels = c("Much longer title for 10", 
                              "Much nicer title for 9",
                              "Lovely title for 8",
                              "A lovely title for 7",
                              "Everyone wants a name for 4"))
