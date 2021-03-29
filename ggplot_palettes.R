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



# NineteenEightyR - rainplots galore


chickwts %>% 
  ggplot(aes(x = feed)) +
  geom_point(aes(y = weight, colour = feed), position = position_jitter(width = .13), size = 0.5, alpha = 0.6) +
  see::geom_violinhalf(aes(y = weight, alpha= 0.3, fill = feed), linetype = "dashed", position = position_nudge(x = .2)) +
  geom_boxplot(aes(y = weight, alpha = 0.3, colour = feed), position = position_nudge(x = -.1), width = 0.1, outlier.shape = NA) +
  scale_fill_manual(values = NineteenEightyR::electronic_night(n = 6)) +
  scale_colour_manual(values = NineteenEightyR::electronic_night(n = 6)) +
  theme_classic() +
  labs(x = "Feed Type", y = "Weight (g)") +
  theme(legend.position = "none") +
  coord_flip()



# nord - more rainplots

library(nord)

attitude %>% 
  pivot_longer(cols = c(rating:advance),names_to = "attitude", values_to = "score") %>% 
  ggplot(aes(x = attitude)) +
  geom_point(aes(y = score, colour = attitude), position = position_jitter(width = .13), size = 0.5, alpha = 0.6) +
  see::geom_violinhalf(aes(y = score, alpha= 0.3, fill = attitude), linetype = "dashed", position = position_nudge(x = .2)) +
  geom_boxplot(aes(y = score, alpha = 0.3, colour = attitude), position = position_nudge(x = -.1), width = 0.1, outlier.shape = NA) +
  scale_fill_nord(palette = "algoma_forest") +
  scale_colour_nord(palette = "algoma_forest") +
  theme_classic() +
  labs(x = "Attitude Question", y = "% Favourable in Department") +
  theme(legend.position = "none") +
  coord_flip()
