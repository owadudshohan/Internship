library(ggplot2)
ggplot(data = diamonds, mapping = aes(x=cut, fill=clarity))+
  geom_bar(alpha=1/5, position = "identity")