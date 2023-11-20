library(ggplot2)
ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
  geom_point()+
  geom_smooth(se=FALSE)    #se = False “, it will remove the confidence interval.