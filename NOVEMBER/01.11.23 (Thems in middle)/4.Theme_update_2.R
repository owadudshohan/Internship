library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base

# Save the current theme
old_theme <- theme_get()

# Define the custom theme
custom_theme <- theme(
  plot.background = element_rect(fill = "darkgreen", colour = NA),
  panel.background = element_rect(fill = "lightblue3", colour = NA),
  axis.text = element_text(colour = "linen"),
  axis.title = element_text(colour = "linen")
)

# Restore the original theme by setting it back
theme_set(old_theme)

# Apply the custom theme to the plot
#plot_with_custom_theme <- base + custom_theme
#plot_with_custom_theme

