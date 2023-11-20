library(ggplot2)
base<-ggplot(toy,aes(big, const))+
  geom_point()+
  labs(x="BIG", y="CONST")+
  scale_y_continuous(breaks = NULL)
base
base+scale_x_continuous(
  breaks = c(2000, 4000),
  labels = c("2k", "4k")
)