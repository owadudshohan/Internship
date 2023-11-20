library(ggplot2)
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()+
  geom_jitter(width = 20, height = 10)
  