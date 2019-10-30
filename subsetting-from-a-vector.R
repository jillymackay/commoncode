# Subsetting from a vector of columns

library(tidyverse)


dat <- tibble (col1 = c(1:10),
               col2 = c(1:10),
               col3 = c(1:10))

key_data <- tibble(criteria = c("want", "want", "donotwant"),
                   colnames = c("col1", "col2", "col3"))


vec_of_wants <- key_data %>% 
  filter(criteria == "want") %>% 
  pull(colnames)

# try select_at()
subset_dat <- dat %>% 
  select_at(vec_of_wants)

subset_dat

# what if no matches - i.e. vec_of_wants empty?
subset_dat <- dat %>% 
  select_at(character(0))

subset_dat
