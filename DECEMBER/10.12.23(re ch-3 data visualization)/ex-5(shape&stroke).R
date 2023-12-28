library(ggplot2)
ggplot(mpg, aes(displ, hwy))+
  geom_point(shape=21, color="black", fill="white", size=5, stroke=5)