library(ggplot2)
ggplot(data = mpg, mapping = aes(x=displ, y=hwy, color=drv, linrtype=drv))+
  geom_point()+
  geom_smooth()