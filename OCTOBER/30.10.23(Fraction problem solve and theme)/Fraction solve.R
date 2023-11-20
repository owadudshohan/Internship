library(ggplot2)
df1 <- data.frame(x = 1:3, y = 1:3, gender = c("f", "f", "m"))
df2 <- data.frame(x = 2, y = 2)

ggplot(df1, aes(x, y)) + 
  geom_point(data = df2, colour = "red", size = 3) + 
  geom_point() + 
  facet_wrap(~gender) +
  scale_x_continuous(breaks = 1:3) +
  scale_y_continuous(breaks = 1:3)
