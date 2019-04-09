library(tidyverse)
library(likert)



# This example which I've modified from 
# https://github.com/jbryer/likert/blob/master/demo/UnusedLevels.R#L6
# works


# Create your levels
l1 <- c("Level1", "Level2", "Level3", "Level4")
l2 <- c("LevelA", "LevelB")

d <- data.frame(grp=factor(sample(c('g1', 'g2'), 100, replace = TRUE)),
                x1=factor(sample(l1[1:3], 100, replace=TRUE)),
                x2=factor(sample(l1[1:4], 100, replace=TRUE)),
                y1=factor(sample(l2[1:2], 100, replace=TRUE)),
                check.names=FALSE)


sapply(d, class) # All columns are factors
sapply(d, function(x) { length(levels(x)) } ) # The number of levels in each factor


# note you don't need seq_along like jbryer's example
for(i in 2:3) {
  d[,i] <- factor(d[,i], levels=l1)
}

for(i in 4) {
  d[,i] <- factor(d[,i], levels=l2)
}


dlikert1 <- likert (items = d[,2:3], grouping = d[,1])
dlikert2 <- likert (items = d[,4, drop = FALSE], grouping = d[,1])


plot(dlikert1) 
# Note that all 4 levels appear in legend while not present in x1
# This is good! 

plot(dlikert2)
# And the simple one works too. 


# And a tidyverse tibbles approach that also works!:

d2 <- tibble (grp = c("A","B","A","B","A","B"),
              x1 = c("0", "1", "2", "1", "2", "1"),
              x2 = c("0", "2", "1", "3", "1", "1"),
              y1 = c("0", "1", "0", "1", "1", "1")) %>%
  mutate_at(.vars = vars (x1:x2),
            .funs = function (x) case_when (x == '0' ~ "Level1",
                                            x == '1' ~ "Level2",
                                            x == '2' ~ "Level3",
                                            x == '3' ~ "Level4",
                                            TRUE ~ as.character(x))) %>%
  mutate_at(.vars = vars (y1),
            .funs = function (x) case_when (x == '0' ~ "LevelA",
                                            x == '1' ~ "LevelB",
                                            TRUE ~ as.character(x))) %>%
  mutate_all(factor) 

d2 <- as.data.frame(d2)


sapply(d2, class) #Verify that all the columns are indeed factors
sapply(d2, function(x) { length(levels(x)) } ) # The number of levels in each factor

l1 <- c("Level1", "Level2", "Level3", "Level4")
l2 <- c("LevelA", "LevelB")


for(i in 2:3) {
  d2[,i] <- factor(d2[,i], levels=l1)
}

for(i in 4) {
  d2[,i] <- factor(d2[,i], levels=l2)
}


sapply(d2, function(x) { length(levels(x)) } ) # Observe difference in factor levels


d2likert1 <- likert (items = d2[,2:3], grouping = d2[,1])
d2likert2 <- likert (items = d2[,4, drop = FALSE], grouping = d2[,1])

plot(d2likert1)
plot(d2likert2)

