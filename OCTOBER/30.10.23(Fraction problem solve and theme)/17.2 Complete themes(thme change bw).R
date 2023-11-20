library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base + theme_bw() + ggtitle("theme_bw()")
#It provides a minimalist look with white backgrounds, black text, and gray grid lines, making it well-suited for basic data visualization where color is not a primary concern.