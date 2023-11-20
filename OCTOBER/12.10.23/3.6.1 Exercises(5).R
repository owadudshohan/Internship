library(ggplot2)
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  geom_smooth(mapping = aes(x=displ, y=hwy))