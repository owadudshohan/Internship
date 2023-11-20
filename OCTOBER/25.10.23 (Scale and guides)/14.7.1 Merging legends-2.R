library(ggplot2)
ggplot(toy, aes(up, up)) + 
  geom_point(size = 8, colour = "grey20", show.legend = TRUE) +
  geom_point(aes(colour = txt), size = 2) 