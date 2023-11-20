library(ggplot2)
p <- ggplot(mpg2, aes(cty, hwy)) + 
  geom_abline() +
  geom_jitter(width = 0.1, height = 0.1)

p + facet_wrap(~cyl, scales = "free")
#by setting scales = "free", you are allowing each facet created by facet_wrap(~cyl) to have its own y-axis scale