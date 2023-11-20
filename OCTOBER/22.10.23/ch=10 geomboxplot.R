library(ggplot2)
base <- ggplot(mpg, aes(drv, hwy)) +
  geom_hline(yintercept = 28, colour = "red") +
  geom_boxplot()

base
base + coord_cartesian(ylim = c(10, 35)) # works as expected
base + ylim(10, 35)
