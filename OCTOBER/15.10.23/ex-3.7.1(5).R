
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))

#Specifying group = 1 implies that we are using a single line connecting all the points.
#without using the group=1 command. It gives the wrong representation of the plot and matches all values to 1.