# bar <- ggplot(data = diamonds) + 
#   geom_bar(
#     mapping = aes(x = cut, fill = cut), 
#     show.legend = FALSE,
#     width = 1
#   ) + 
#   theme(aspect.ratio = 1) +
#   labs(x = NULL, y = NULL)
# 
# bar + coord_polar()

library(ggplot2)
bar<-ggplot(data=mpg)+
  geom_bar(
    mapping = aes(x=cyl, fill=cyl), 
    show.legend=FALSE,
    width = 1
  )+theme(aspect.ratio = 1)+
  labs(x= "category", y="value")
bar+coord_polar()