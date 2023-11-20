library(ggplot2)
library(readr)

last4Months <- read_csv("E:/WORK/NOVEMBER/05.11.23(Problem solve)/last4Months.csv")
last4Months$WeekDay <- as.factor(last4Months$WeekDay)

ggplot(data = last4Months, aes(x = .data[[colnames(last4Months)[1]]], y = .data[[colnames(last4Months)[4]]], color = Month)) + 
  geom_point(size = 0.75) + 
  geom_point(aes(size = DayNr, color = Month), alpha = 1/3) + 
  facet_wrap(~WeekDay, ncol = 3) + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12), labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +
  theme(
    plot.title = element_text(size = rel(1)), 
    legend.title = element_text(size = rel(1)), 
    legend.position = "top",
  ) +
  guides(x = guide_axis(angle = 30), color = "none")

