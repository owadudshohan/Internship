library(ggplot2)

plot <- ggplot(mpg, aes(drv, cyl)) +
  geom_point(aes(), color="darkorange")

plot + theme_dark() +
  theme(
    plot.background = element_rect(fill = "black"),
    axis.text = element_text(color = "white"),
    axis.title = element_text(color = "white"),
    panel.grid=element_line(color = "black")
  )