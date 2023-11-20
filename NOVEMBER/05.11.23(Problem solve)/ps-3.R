library(ggplot2)
library(readr)

last4Months <- read_csv("E:/WORK/NOVEMBER/05.11.23(Problem solve)/last4Months.csv")
last4Months$WeekDay <- as.factor(last4Months$WeekDay)

# Convert "Month" to a factor
last4Months$Month <- factor(last4Months$Month)

ggplot(data = last4Months, mapping = aes_string(x = "Month", y = colnames(last4Months)[4], color = "Month")) + 
  geom_point(aes(size = DayNr), alpha = 1/3) + 
  facet_wrap(~WeekDay, ncol = 3) + 
  scale_x_discrete(labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +
  scale_color_discrete(name = "Month") +  # Adding the Month legend
  theme(
    plot.title = element_text(size = rel(1)), 
    legend.title = element_text(size = rel(1)), 
    legend.position = "top"
  ) +
  guides(x = guide_axis(angle = 30), color = "none")
