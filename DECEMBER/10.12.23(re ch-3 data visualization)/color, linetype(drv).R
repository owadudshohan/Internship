library(ggplot2)
ggplot(data = mpg,mapping = aes(x=displ,y=hwy, color=drv))+
geom_smooth()+
  geom_point()