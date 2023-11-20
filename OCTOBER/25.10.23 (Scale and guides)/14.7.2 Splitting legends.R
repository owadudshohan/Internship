library(ggplot2)
base <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = factor(year)), size = 5) + 
  scale_colour_brewer("year", type = "qual", palette = 2) 

base
#scale_colour_brewer function to specify that you want to use a qualitative (qual) color palette.
#it easier for viewers to understand and interpret the plot.(different color plot)