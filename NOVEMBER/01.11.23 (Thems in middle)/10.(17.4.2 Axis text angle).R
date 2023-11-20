library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()

# Useful for long labels
base + theme(axis.text.x = element_text(angle = -45, vjust = 0.5))