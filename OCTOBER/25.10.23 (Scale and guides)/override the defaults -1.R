library(ggplot2)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = class)) + 
  scale_x_continuous(name = "A really awesome x axis label") +
  scale_y_continuous(name = "An amazingly great y axis label")

# library(ggplot2)
# ggplot(mpg, aes(displ, hwy))+
#   geom_point(aes(color=class))+
#   scale_x_continuous(name = "A really awesome x axis label")+
#   scale_y_continuous(name = "An really amazingly great y axis label")