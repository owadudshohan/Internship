#position = "identity" will place each object exactly where it falls in the context of the graph.
library(ggplot2)
ggplot(data=diamonds, mapping = aes(x=cut, fill=clarity))+
  geom_bar(alpha=1/5, position = "identity")