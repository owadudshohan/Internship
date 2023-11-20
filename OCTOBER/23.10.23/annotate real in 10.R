ggplot(mpg, aes(x = hwy, y = class)) + 
  geom_point() +
  annotate("text", x = 5, y = 1:7, label=1:7)