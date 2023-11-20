library(ggplot2)
base <- ggplot(toy, aes(const, up)) + 
  geom_point(aes(shape = txt, colour = txt)) + 
  scale_x_continuous(NULL, breaks = NULL)

base
base + labs(shape = "Merged legend", colour = "the legend")