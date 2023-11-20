library(ggplot2)
base <- ggplot(toy, aes(big, const)) + 
  geom_point() + 
  labs(x = NULL, y = NULL) +
  scale_y_continuous(breaks = NULL) 

base
