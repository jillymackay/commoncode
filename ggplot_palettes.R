# ggplot and custom colours

# I always forget how to use my favourite palettes. 


library(tidyverse)



# LaCroix

library(LaCroixColoR)

# Colour must be a factor

mpg %>% 
  ggplot(aes(x = cty, y = hwy, colour = as.factor(hwy))) +
  geom_point()  +
  scale_colour_manual(values = lacroix_palette("PeachPear", type = "continuous", n = 27))
