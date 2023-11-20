library(ggplot2)

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = class)) +
  scale_x_sqrt(name = "displlllll", breaks = c(2, 4, 6, 8), labels = c("shohan", "4", "6", "8")) + 
  scale_y_continuous(name = "Highway MPG", breaks = seq(15, 40, by = 5), labels = seq(15, 40, by = 5)) +
  scale_colour_brewer(name = "shohan", palette = "Set1", type = "qual", labels = c("SHOHAN", "Midsize", "SUV", "Truck", "2seater", "subcompact", "pickup"))

