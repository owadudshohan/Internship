library(ggplot2)
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p + annotate("text", x = 4, y = 25, label = "Some text")

#The "text" argument indicates that you want to add text to the plot. 