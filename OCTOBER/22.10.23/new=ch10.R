# # library(ggplot2)
# # ggplot(mpg, aes(displ, hwy)) + 
# #   geom_point() +
# #   facet_wrap(vars(year))+
# #   lims(x = c(1, 7), y = c(10, 45))
# #vars() is a quoting function that takes inputs to be evaluated in the context of a dataset. 
# 
# library(ggplot2)
# ggplot(mpg, aes(displ, hwy))+
#   geom_point()+
#   facet_wrap(vars(year))+
#   lims(x=c(1,7), y=c(10,45))

library(ggplot2)
ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  facet_wrap(~year)+
  lims(x=c(1,5), y=c(10,60))