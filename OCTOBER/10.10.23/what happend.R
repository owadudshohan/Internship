library(ggplot2)
ggplot(data = mpg)+
  geom_point(mapping = aes(color = displ < 5))