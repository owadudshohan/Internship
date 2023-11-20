library(ggplot2)
ggplot(data = diamonds)+
  #geom_bar(mapping = aes(x=cut, color=cut),show.legend = FALSE)
  geom_bar(mapping = aes(x=cut, fill=cut))