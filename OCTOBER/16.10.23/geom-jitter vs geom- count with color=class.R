library(ggplot2)
ggplot(data=mpg, mapping = aes(x=displ, y=hwy, color=class))+
  #geom_jitter()
  geom_count()