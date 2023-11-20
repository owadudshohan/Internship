library(ggplot2)
df <- data.frame(
  x = c("Shohan S", "Shohan222 M", "Shohan3333 L"), 
  y = letters[1:3]
)
base <- ggplot(df, aes(x, y)) + geom_point()
base
base + 
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0, color = "red")) + 
  xlab("This is X") + 
  ylab("This is Y")