library(ggplot2)
df <- data.frame(
  x = c("Shohan S", "Shohan222 M", "Shohan3333 L"), 
  y = letters[1:3]
)
base <- ggplot(df, aes(x, y)) + geom_point()
base
