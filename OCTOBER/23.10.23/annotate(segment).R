library(ggplot2)
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p + annotate("segment", x = 2.5, xend = 4, y = 15, yend = 25,
             colour = "blue")