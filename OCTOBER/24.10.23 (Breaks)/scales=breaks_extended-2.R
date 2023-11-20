library(ggplot2)
base<-ggplot(toy, aes(big, const))+
  geom_point()+
  labs(x="B", y="CoNsT")+
  scale_y_continuous(breaks = NULL)
  base
  base+scale_x_continuous(breaks = scales::breaks_extended(n=3))
  #aims to automatically choose a minimal number of breaks on
  #the x-axis to prevent overcrowding and maintain a compact representation,