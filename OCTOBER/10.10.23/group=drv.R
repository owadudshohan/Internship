library(ggplot2)
ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy, group=drv))