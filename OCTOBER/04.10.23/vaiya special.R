# Load required libraries
library(fpp2)
library(ggplot2)
library(ggfortify)

# Preprocess the data
df <- marathon %>% 
  splinef(lambda = 0) %>% 
  fortify()

# Define geoms for prediction intervals
geom_rib80 <- geom_ribbon(aes(ymin = `Lo 80`, ymax = `Hi 80`), fill = "#75575786", alpha = 1/5)
geom_rib95 <- geom_ribbon(aes(ymin = `Lo 95`, ymax = `Hi 95`), fill = "#5C494986", alpha = 1/5)

# Create the main plot
ggplot(data = df, mapping = aes(x = Index)) + 
  geom_line(mapping = aes_string(y = colnames(df)[[2]]), color = "lightgrey", alpha = 1/3, na.rm = TRUE) + 
  geom_line(mapping = aes_string(y = colnames(df)[[3]]), color = "orange", na.rm = TRUE) + 
  geom_rib80 +
  geom_rib95 +
  geom_line(mapping = aes(y = `Point Forecast`), color = "gold", size = 1.05, alpha = 1/3, na.rm = TRUE) + 
  xlab("Year") +
  ylab("Winning Time (minute)") +
  ggtitle("Forecast of Boston marathon winning times") + 
  theme(
    plot.title = element_text(size = rel(1.0), colour = "gold", hjust = 0.5), 
    axis.title.x = element_text(size = rel(1.0), colour = "gold"),
    axis.title.y = element_text(size = rel(1.0), colour = "gold"),
    axis.text.x =  element_text(size = rel(1.15), colour = "white"),
    axis.text.y =  element_text(size = rel(1.15), colour = "white"),
    panel.background = element_blank(),
    plot.background = element_rect(fill = "black", colour = NA),
    panel.grid.major = element_line(linetype = "dotted"),
    panel.grid.minor = element_line(linetype = "dotted"),
    legend.position = "top",  # Adjust legend position as needed
    legend.title = element_blank()  # Remove legend title
  ) +
  guides(
    x = guide_axis(angle = 20),
    y = guide_axis(angle = 20)
  )
