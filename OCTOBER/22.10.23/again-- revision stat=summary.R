library(ggplot2)
ggplot(data = diamonds)+
  stat_summary(
    mapping = aes(x=cut, y=depth, color=cut),
    fun.max = max,
    fun.min = min,
    fun=median,
  )