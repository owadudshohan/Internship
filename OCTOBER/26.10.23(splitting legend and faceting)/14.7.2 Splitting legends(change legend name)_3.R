library(ggplot2)
library(ggnewscale)

base <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = factor(year)), size = 5) + 
  scale_colour_brewer("year", type = "qual", palette = 5)

base
base + 
  ggnewscale::new_scale_colour() + 
  geom_point(aes(colour = cyl == 4), size = 1, fill = NA) + 
  scale_colour_manual("4 cylinder", values = c("grey60", "black"), breaks = c(FALSE, TRUE), labels = c("Shohan", "SHOHAN"))
