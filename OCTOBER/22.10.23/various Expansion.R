library(ggplot2)
base <- ggplot(faithfuld, aes(waiting, eruptions)) + 
  geom_raster(aes(fill = density)) + 
  theme(legend.position = "none") + 
  labs(x = NULL, y = NULL)

base 
base + 
  scale_x_continuous(expand = expansion(add=3)) + 
  scale_y_continuous(expand = expansion(add=3)) 