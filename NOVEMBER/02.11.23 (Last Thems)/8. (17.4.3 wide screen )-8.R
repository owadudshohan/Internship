library(ggplot2)
df <- data.frame(x = 1:4, y = 1:4, z = rep(c("a", "b"), each = 2))
#The rep() function in R is used to replicate or repeat elements of a vector.
base <- ggplot(df, aes(x, y)) + geom_point()
base2 <- base + theme(plot.background = element_rect(colour = "grey50"))
# Wide screen
base2 + theme(aspect.ratio = 9 / 16)