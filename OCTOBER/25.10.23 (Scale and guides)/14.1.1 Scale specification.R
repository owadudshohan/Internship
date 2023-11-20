library(ggplot2)

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = class))

# ggplot(mpg, aes(displ, hwy)) + 
#   geom_point(aes(colour = class)) +
#   scale_x_continuous() + 
#   scale_y_continuous() + 
#   scale_colour_discrete()