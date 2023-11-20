library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point(aes( ), color="blue", size=3)
base + theme(panel.grid.major = element_line(colour = "darkorange"))+
  theme(panel.grid.minor  = element_line(colour = "purple"))