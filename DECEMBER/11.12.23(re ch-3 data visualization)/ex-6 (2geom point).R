library(ggplot2)
ggplot(data = mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(size=4, color="white")+
  geom_point(aes(color=drv))