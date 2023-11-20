library(ggplot2)

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = class)) +
  scale_x_sqrt(name = "displllll") + 
  scale_colour_brewer(name = "shohan", palette = "Dark2", type = "qual", labels = c("moon", "boss", "SUV", "Truck", "2seater", "subcomoact", "pickup"))

#The "Set1" palette is one of the predefined qualitative color palettes available in the RColorBrewer package,
#replace "Set1" with other available palettes like "Dark2," "Paired," "Blues," etc.

#scale_colour_brewer function to specify that you want to use a qualitative (qual) color palette.
#it easier for viewers to understand and interpret the plot.(different color plot)