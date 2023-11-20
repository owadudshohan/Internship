library(ggplot2)
library(readr)
last4Months <- read_csv("E:/WORK/NOVEMBER/05.11.23(Problem solve)/last4Months.csv")

last4Months$WeekDay <- as.factor(last4Months$WeekDay)

# Make sure "Month" is a factor (discrete variable)
last4Months$Month <- as.factor(last4Months$Month)

# Create a scatterplot using ggplot
ggplot(data = last4Months, aes(x = colnames(last4Months)[1], y = colnames(last4Months)[4], color = Month)) +
  geom_point(size = 0.75) + 
  geom_point(aes(size = DayNr), alpha = 1/3) +
  facet_wrap(~WeekDay, ncol = 3) + 
  
  # Define X-axis labels
  scale_x_discrete(breaks = 1:12, labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")) +
  
  # Customize the plot's appearance
  theme(
    plot.title = element_text(size = rel(1)), 
    legend.title = element_text(size = rel(1)), 
    legend.position = "top",
  ) +
  guides(x = guide_axis(angle = 30))
