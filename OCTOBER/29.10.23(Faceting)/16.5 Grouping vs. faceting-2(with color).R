library(ggplot2)
df <- data.frame(
  x = rnorm(120, c(0, 2, 4)),
  y = rnorm(120, c(1, 2, 1)),
  z = letters[1:3]
)
ggplot(df, aes(x, y)) + 
  geom_point(aes(color=z)) + 
  facet_wrap(~z)
