library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point(aes( ))
base
last_plot() + theme(panel.grid.minor = element_blank())+
  theme(panel.grid.major = element_blank())
#last_plot() is a function from the ggplot2 package that returns the last plot created using ggplot2 functions.
#In the following line, last_plot() is used to refer to the last created plot, which is base.