library(ggplot2)

df <- data.frame(x = 1:3, y = 1:3)

# Create the base plot with blue points
base <- ggplot(df, aes(x, y)) + geom_point(aes(),color = "white")

# Modify the theme to change plot element and grid line color to orange
custom_theme <- theme_dark() +
  theme(
    panel.grid = element_line(color = "orange")
    
  )

# Add the modified theme
plot_with_custom_theme <- base + custom_theme
