library(ggplot2)
base <- ggplot(toy, aes(big, const)) + 
  geom_point() + 
  labs(x = "BIG", y = "CONST") +
  scale_y_continuous(breaks = NULL) 

base
  base + scale_x_continuous(breaks = c(1000,1500,1700, 2000, 4000))
  
  #control over the positions of tick marks on an axis. 