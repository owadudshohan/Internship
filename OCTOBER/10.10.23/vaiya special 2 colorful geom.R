library(ggplot2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y=hwy, size=class, color=class), alpha=0.4)+
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color=drv))