library(ggplot2)
ggplot2::mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
