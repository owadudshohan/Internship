#position = "identity" will place each object exactly where it falls in the context of the graph.
library(ggplot2)
ggplot(data = diamonds, mapping = aes(x=cut, color=cut))+
  geom_bar(fill=NA, position = "identity")