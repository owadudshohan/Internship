library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()

# Accentuate the axes
base + theme(axis.line = element_line(colour = "grey50", linewidth = 2))+
  theme(panel.grid = element_line(linetype = "dotted", color = "darkblue"))