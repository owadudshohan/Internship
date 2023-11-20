library(ggplot2)
ggplot(data = mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(mapping = aes(color=drv))+
  geom_point(shape=21, color="white", stroke=2)