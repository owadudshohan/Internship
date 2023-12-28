library(ggplot2)
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth), color = "gold",
    fun.min = min,
    fun.max = max,
    fun = median
  )+
  theme_classic() +
  theme(
    panel.background = element_rect(fill = "black"),
    plot.background = element_rect(fill = "black"),
    axis.title = element_text(colour = "gold"),
    axis.text = element_text(colour = "white", angle = 20),
    axis.line = element_line(colour = "grey50"),
    plot.title = element_text(colour = "gold") 
  ) + ylab("Max-Min range of diamonds depth") +
  guides(
    x = guide_axis(angle = 20),
    y = guide_axis(angle = 20)) + ggtitle("Depth analysis over diamonds cut category")


