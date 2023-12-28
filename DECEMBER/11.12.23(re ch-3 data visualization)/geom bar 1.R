library(ggplot2)
ggplot(data = diamonds)+
  geom_bar(aes(x=cut))