library(ggplot2)
base<-ggplot(toy, aes(big, const))+
  geom_point()+
  labs(x="Big", y="const")+
  scale_y_continuous(breaks = NULL)
base
base+scale_x_continuous(breaks = scales::breaks_extended())
#scales::breaks_extended() creates automatic breaks for numeric axes.