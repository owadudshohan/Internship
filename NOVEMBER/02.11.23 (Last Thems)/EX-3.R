library(ggplot2)

plot <- ggplot(mpg, aes(drv, cyl)) +
  geom_point() +
  labs(title = "Elegant Theme Example")

elegant_theme <- theme_minimal() +
  theme(
    plot.background = element_rect(fill = "linen"),
    panel.background=element_rect(fill="white"),
    text = element_text(family = "serif")
  )
