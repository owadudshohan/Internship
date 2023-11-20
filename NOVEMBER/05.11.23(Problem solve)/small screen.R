library(ggplot2)
library(readr)

# Read your data
last4Months <- read_csv("E:/WORK/NOVEMBER/05.11.23(Problem solve)/last4Months.csv")

# Convert WeekDay to a factor
last4Months$WeekDay <- as.factor(last4Months$WeekDay)

# Define the ggplot
plot <- ggplot(data = last4Months, mapping = aes_string(x = colnames(last4Months)[1], y = colnames(last4Months)[4]), color = Month) + 
  geom_point(aes(color = Month), size = 2) +  # Adjust the point size
  facet_wrap(~WeekDay, ncol = 3) + 
  geom_point(aes(size = DayNr, color = Month), alpha = 1/3) +
  scale_x_continuous(breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")) +
  theme(
    plot.title = element_text(size = rel(1)), 
    legend.title = element_text(size = rel(1)), 
    legend.position = "top",
  ) +
  guides(x = guide_axis(angle = 30), color = "none")

# Set the plot dimensions for saving (adjust the width and height as needed)
ggsave("output_plot.png", plot, width = 6, height = 4)

# Display the plot
plot
