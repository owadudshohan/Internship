library(ggplot2)
p <- ggplot(mpg2, aes(cty, hwy)) + 
  geom_abline() +
  #slope = 0, intercept = 20
  #Reference lines: horizontal, vertical, and diagonal
  geom_jitter(width = 0.1, height = 0.1)

p + facet_wrap(~cyl)