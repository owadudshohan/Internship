# library(ggplot2)
# ggplot(data = diamonds)+
# stat_summary(
#   mapping = aes(x=cut, y=depth),
#   fun.max = max,
#     fun.min=min,
#   fun=median,
#     
# )
# library(ggplot2)
# ggplot(data = diamonds)+
#   stat_summary(
#     mapping = aes(x=cut,y=depth),
#     fun.max = min,
#     fun.min= max,
#     fun=median,
#   )
library(ggplot2)
ggplot(data = diamonds)+
  stat_summary(
    mapping = aes(x=cut, y=depth),
    fun.max = max,
    fun.min=min,
    fun=median,
  )