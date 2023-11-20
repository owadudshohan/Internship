library(ggplot2)
ggplot(data=mpg, mapping=aes(x=displ, y=hwy))+
  geom_point(mapping = aes(color=drv))+
  geom_smooth(se= FALSE)