library(ggplot2)
ggplot(data = diamonds)+
  stat_summary(
    mapping = aes(x=cut, y=depth),
    fun.min = min,
    fun.max = max,
    fun=median
  )