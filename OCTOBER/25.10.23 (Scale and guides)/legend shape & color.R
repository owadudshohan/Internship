library(ggplot2)
base <- ggplot(toy, aes(const, up)) +
  scale_x_continuous(NULL, breaks = NULL)

#base + geom_point(aes(colour = txt))
#base + geom_point(aes(shape = txt))
base + geom_point(aes(shape = txt, colour = txt))