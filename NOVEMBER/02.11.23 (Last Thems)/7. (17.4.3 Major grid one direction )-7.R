library(ggplot2)
df <- data.frame(x = 1:4, y = 1:4, z = rep(c("a", "b"), each = 2))
#The rep() function in R is used to replicate or repeat elements of a vector.
base <- ggplot(df, aes(x, y)) + geom_point()
# Just in one direction  
base + theme(
  panel.grid.major.x = element_line(color = "gray60", linewidth = 0.8)
)