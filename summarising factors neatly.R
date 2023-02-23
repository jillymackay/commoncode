# A function for creating categorical summary tables




factor_sum <- function(factor_name) {
  
  x <-table(factor_name) %>% 
    as.data.frame()
  
  xx <- prop.table(table(factor_name)) %>% 
    as.data.frame() %>% 
    mutate(Perc = round((Freq*100),2)) %>% 
    select(-Freq)
  
  xxx <- full_join(x,xx)
  
  
  return(xxx)
 
  
}

factor_sum(mpg$manufacturer)


