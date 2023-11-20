library(ggplot2)
df <- data.frame(x = 1:4, y = 1:4, z = rep(c("a", "b"), each = 2))
#The rep() function in R is used to replicate or repeat elements of a vector.
base <- ggplot(df, aes(x, y)) + geom_point()
# Modify background
base + theme(panel.background = element_rect(fill = "lightblue"))