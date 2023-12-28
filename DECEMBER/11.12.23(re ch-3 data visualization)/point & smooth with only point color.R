library(ggplot2)
ggplot(data = mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(aes(color=class))+
  geom_smooth()