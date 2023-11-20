# #Answer: show. legend = FALSE makes the scale not to have any legend for the aesthetic where it was included.
# If it is #removed, the legend appears on the scale because its default value is TRUE.
library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color = class), show.legend = FALSE) + 
  geom_smooth()
