library(ggplot2)
base<-ggplot(toy, aes(big, const))+
  geom_point()+
  labs(x="big", y="const")+
  scale_y_continuous(breaks = NULL)
base
base+scale_y_continuous(labels = scales::label_percent())