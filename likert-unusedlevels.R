
# a tidyverse approach to solving the 
# 'unused levels' error in the likert package
# `factor` from base works better than `parse_factor` when combined with mutate_at. It also doesn't convert NA to character

# See:  https://github.com/jbryer/likert/blob/master/demo/UnusedLevels.R#L6



library(tidyverse)
library(likert)


dat <- tibble (grp = c("A","B","A","B","A","B"),
              x1 = c("z", "x", "x", "z", NA, "z"),
              x2 = c("y", "x", "z", "y", "z", "z"),
              y1 = c("Y", "X", "Y", "Z", "Z", "Z")) 

dat <- as.data.frame(dat)

dlikert1 <- likert (items = dat[,2:3], grouping = dat[,1])
dlikert2 <- likert (items = dat[,4, drop = FALSE], grouping = dat[,1])
# Both return an error that all items (columns) must have the same number of levels



# The Solution:

dat2 <- dat %>% 
  mutate_at (.vars = vars (x1:x2), 
             .funs = funs(factor(., levels = c("x",
                                               "y",
                                               "z"))))  %>% 
  mutate_at (.vars = vars(y1), 
             .funs = funs(factor(., levels = c("X", 
                                               "Y", 
                                               "Z"))))

dat2 <- as.data.frame(dat2)


# Now runs beautifully
d2likert1 <- likert (items = dat2[,2:3], grouping = dat2[,1])
d2likert2 <- likert (items = dat2[,4, drop = FALSE], grouping = dat2[,1])

plot(d2likert1)
plot(d2likert2)



# Note - you must use as.data.frame() NOT as_data_frame() for reasons that escape me
