library(ggplot2)
ggplot(mpg, aes(x = hwy, y = class)) + 
  geom_jitter(width = 0, height = .25) +
  annotate("text", x = 5, y = 1:7, label = 1:7)