library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base + theme_classic() + ggtitle("theme_classic()")
#base + theme_void() + ggtitle("theme_void()")