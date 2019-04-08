# Using the bang operator and tidyeval to pass arguments to ggplot2

# Desired chart:

ggplot(mpg, aes(class, cty))+ 
  geom_boxplot(aes(fill=factor(cyl))) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Box plot", 
       subtitle="City Mileage grouped by Class of vehicle",
       caption="Source: mpg",
       x="Class of Vehicle",
       y="City Mileage") +
  facet_grid(~cyl)



# A tidyeval way
fastplot <- function (data, grp_factor, facet) {
  g <- enquo(grp_factor)
  f <- enquo(facet)
  
  data %>%
    ggplot(aes(x = !!g, cty))+ 
    geom_boxplot(aes(fill=factor(!!f))) + 
    theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
    labs(title="Box plot", 
         subtitle="City Mileage grouped by Class of vehicle",
         caption="Source: mpg",
         x="Class of Vehicle",
         y="City Mileage") +
    facet_wrap(facet = vars(!!f))  # Note new helper inside facet_wrap 'vars'
  
  
  
}
fastplot(mpg, class, cyl)


