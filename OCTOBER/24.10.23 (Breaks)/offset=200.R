library(ggplot2)
base<-ggplot(toy, aes(big, const))+
  geom_point()+
  labs(x="BIIG", y="constt")+
  scale_y_continuous(breaks = NULL)
  base
base+scale_x_continuous(breaks = scales::breaks_width(800, offset = 200))