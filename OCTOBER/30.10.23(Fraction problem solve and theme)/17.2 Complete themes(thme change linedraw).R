library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base + theme_linedraw() + ggtitle("theme_linedraw()")
#This theme is designed to create plots with a hand-drawn or sketch-like appearance