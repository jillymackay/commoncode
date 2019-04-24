library(tidyverse)


dat <- tibble (ID = c("R01", "R02", "R03", "R04"),
               Response =c("Violin, Drums", "Violin", "Drums, Brass, Piano", "Piano"))

 

nvars <-
  dat$Response %>% 
  str_split(",") %>% 
  lapply(function(z) length(z)) %>% 
  unlist() %>% 
  max()


dat_split <- dat %>% 
  separate(col = Response, sep = ",",
           into = paste0("Response_",(1:nvars)))

ds <- dat %>% 
  separate(col = Response, sep = ",",
           into = paste0("Response_",(1:(dat$Response %>%
                                           str_split(",") %>%
                                           lapply(function(z) length(z)) %>%
                                           unlist() %>%
                                           max()
           ))))
  

