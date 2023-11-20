library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point(aes( ))
base + theme(plot.background = element_rect(fill = "grey80", colour = NA))