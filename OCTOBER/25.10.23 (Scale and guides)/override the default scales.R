ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = class)) +
  scale_x_sqrt(name="Displll") + 
  scale_colour_brewer(name="shohan")

# using scale_x_sqrt in this code is to address data skewness and 
#the transformation stretches out the lower values more than the higher values. (maintain relationship between lower value and higher value)

#scale_colour_brewer is used to assign distinct, visually appealing colors to 
#different categories in your data when creating a plot