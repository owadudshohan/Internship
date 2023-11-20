library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base
last_plot() + theme(panel.background = element_blank())
last_plot() + theme(
  axis.title.x = element_blank(), 
  axis.title.y = element_blank()
)

last_plot() + theme(axis.line = element_line(colour = "darkblue"))
