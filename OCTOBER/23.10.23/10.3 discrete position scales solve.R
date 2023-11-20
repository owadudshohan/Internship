ggplot(mpg, aes(x = hwy, y = manufacturer)) + 
  geom_point() + 
 scale_x_continuous(name = "Hwy", limits = c(10, 50), breaks = seq(10, 50, by = 5))+
  scale_y_discrete(name="Manufacturer", labels = c(
    "audi" = "F"
  ) )

  #scale_y_discrete(name = "Manufacturer", limits = unique(mpg$manufacturer))
