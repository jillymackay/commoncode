

# Saving ggplot for publication
library(ggplot2)

# DPI (printer dots per inch) and dimensions interact
# So if your chart looks awful and squished - bump up one or the other



tiff("fig1.tiff", units="px", width=3000, height=2000, res=300)


ggplot(aes(x = cyl, y = cty), data= mpg)+
  geom_point()


dev.off()




