library(ggplot2)
library(dplyr)
ggplot(data = mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(mapping = aes(color=class))+
  geom_smooth(data=filter(mpg, class=="subcompact"), se=FALSE)