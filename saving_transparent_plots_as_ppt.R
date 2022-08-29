# ggplot transparency saved as ppt editable file

# yes there are journals that ask for this

library(tidyverse)

library(export)

mpg %>% 
  ggplot(aes(x=cty)) +
  geom_histogram() 

graph2ppt(file="fig.pptx", width=8, height=5)
