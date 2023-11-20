library(ggplot2)

df <- data.frame(x = 1:10, y = 1:10)
base1 <- ggplot(df, aes(x, y)) + geom_point()
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
last_plot() + theme(panel.background = element_blank())
last_plot() + theme(
  axis.title.x = element_blank(), 
  axis.title.y = element_blank()
)
#element_rect(fill= "blue"))