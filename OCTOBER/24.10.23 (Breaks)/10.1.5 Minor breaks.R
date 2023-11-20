library(ggplot2)
mb <- unique(as.numeric(1:10 %o% 10 ^ (0:3)))
base <- ggplot(toy, aes(log, const)) + 
  geom_point() + 
  labs(x = NULL, y = NULL) +
  scale_y_continuous(breaks = NULL) 

base + scale_x_log10() 
#This can be useful for visualizing data with a wide range of values and making it easier
#to see details in both small and large values.
