library(ggplot2)
base <- ggplot(mpg2, aes(displ, hwy)) + 
  geom_blank() + 
  xlab(NULL) + 
  ylab(NULL)
base + facet_grid(drv ~ cyl)