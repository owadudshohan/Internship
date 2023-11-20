library(ggplot2)
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  facet_wrap(~class, nrow=2)