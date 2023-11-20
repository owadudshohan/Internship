library(ggplot2)
p <- ggplot(mpg1, aes(cty, hwy)) + 
  geom_abline() +
  geom_jitter(width = 0.1, height = 0.1)

p + facet_wrap(~cyl, scales = "free")
#The specific reason to use scales = "free" in facet_wrap() is to ensure that each facet has its own independent axis scales