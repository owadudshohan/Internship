library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()

# Style both x and y axis labels
base + theme(axis.text = element_text(color = "blue", size = 12))