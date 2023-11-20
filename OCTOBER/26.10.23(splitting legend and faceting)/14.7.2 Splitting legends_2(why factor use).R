library(ggplot2)
library(ggnewscale)
#library(ggnewscale): Loads the ggnewscale package, which extends ggplot2 by allowing to add multiple color scales to the same plot.
base <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = factor(year)), size = 5) + 
  #factor specify the category of data set( mane koy category er data ache ta define kore day)
  scale_colour_brewer("year", type = "qual", palette = 4) 

base
base + 
  ggnewscale::new_scale_colour() + 
  #It essentially creates a separate color scale for the subsequent layer of geoms, allowing you to apply different color aesthetics to those geoms.
  geom_point(aes(colour = drv == c(4,8)), size = 1, fill = NA) + 
  scale_colour_manual("4 cylinder", values = c("grey60", "black"), breaks = c("FALSE", "TRUE"))

