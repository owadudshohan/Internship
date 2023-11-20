library(ggplot2)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  scale_x_continuous(name = "Label 1") +
  scale_x_continuous(name = "Label 2")