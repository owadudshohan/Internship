# ggplot(mpg, aes(x = hwy, y = class)) + 
#   geom_point() +
#   annotate("text", x = 2, y = 1:7, label = 1:7)

library(ggplot2)

ggplot(mpg, aes(x = hwy, y = class)) + 
  geom_point() +
  annotate("text", x = 5, y = 1:7, label = c("shohan", "shohan2", "Large", "SUV", "Minivan", "Pickup", "2-Seater"))

