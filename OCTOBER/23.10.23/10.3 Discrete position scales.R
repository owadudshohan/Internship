library(ggplot2)
# ggplot(mpg, aes(x = hwy, y = class)) + 
#   geom_point() + 
#   scale_x_continuous() + 
#   scale_y_discrete()

#Using a continuous scale allows the x-axis to be labeled with numeric values, 
#making it suitable for continuous data.
#Using a discrete scale allows the y-axis to be labeled with the distinct vehicle classes, 
#making it more suitable for categorical data.

ggplot(mpg, aes(x = hwy, y = cyl)) + 
  geom_point() + 
  scale_x_continuous(name = "Hwy", limits = c(10, 40), breaks = seq(10, 40, by = 5))+
  scale_y_discrete(name="cyl", limits = c(1,7), breaks=seq(1,7, by=10))
