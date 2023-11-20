library(ggplot2)
mb <- unique(as.numeric(1:10 %o% 10 ^ (0:3)))
base <- ggplot(toy, aes(log, const)) + 
  geom_point() + 
  labs(x = NULL, y = NULL) +
  scale_y_continuous(breaks = NULL) 

base + scale_x_log10(minor_breaks = mb)

# This means customizing the minor (smaller) tick marks on the x-axis using the 
# values in the mb vector that defined earlier. These minor tick marks will be placed at the 
# positions specified by the values in the mb vector, which generated to have unique values 
# from 1 to 10,000.