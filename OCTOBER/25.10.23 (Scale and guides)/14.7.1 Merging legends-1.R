library(ggplot2)
ggplot(toy, aes(up, up)) + 
  geom_point(size = 4, colour = "grey20") +
  geom_point(aes(colour = txt), size = 2) 