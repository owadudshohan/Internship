library(ggplot2)
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, color=drv),show.legend = FALSE)+
  geom_smooth(mapping = aes(x=displ, y=hwy, linetype=class),show.legend = FALSE)