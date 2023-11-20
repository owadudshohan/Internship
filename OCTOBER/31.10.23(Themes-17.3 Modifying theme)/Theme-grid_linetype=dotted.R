library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point(aes( ))
base + theme(panel.grid.major = element_line(linetype = "dotted", color = "blue", size = 1))
#, size = 0.7