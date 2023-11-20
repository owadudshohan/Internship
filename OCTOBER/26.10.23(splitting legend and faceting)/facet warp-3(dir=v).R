library(ggplot2)
base <- ggplot(mpg2, aes(displ, hwy)) + 
  geom_blank() + 
  xlab(NULL) + 
  ylab(NULL)

base + facet_wrap(~class, nrow = 3, dir = "v")
#the dir = "v" argument is used to specify the direction in which the facets are arranged when creating a vertical strip of facets.