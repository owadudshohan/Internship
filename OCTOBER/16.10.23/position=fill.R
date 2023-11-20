#position = "identity" will place each object exactly where it falls in the context of the graph.
# library(ggplot2)
# ggplot(data = diamonds)+
#   geom_bar(mapping = aes(x=cut, fill=clarity), position = "fill")
library(ggplot2)
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, fill=clarity), position = "identity")