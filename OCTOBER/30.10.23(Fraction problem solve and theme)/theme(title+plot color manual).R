labelled <- base +
  labs(
    x = "City mileage/gallon",
    y = "Highway mileage/gallon",
    colour = "Cyl",
    title = "Highway and city mileage are highly correlated"
  ) +
  scale_colour_manual(values = c("red", "blue", "green", "darkorange"))
labelled