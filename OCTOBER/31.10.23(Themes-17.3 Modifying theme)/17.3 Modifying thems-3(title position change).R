library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base_t <- base + labs(title = "This is a ggplot") + xlab("This is x") + ylab("This is y")
base_t + theme(plot.title = element_text(hjust = 1))+
# The hjust parameter controls the horizontal alignment of the text within its bounding box, with 0.5 meaning it's centered horizontally.
  scale_x_continuous(breaks = 1:3)+
  scale_y_continuous(breaks = 1:3)