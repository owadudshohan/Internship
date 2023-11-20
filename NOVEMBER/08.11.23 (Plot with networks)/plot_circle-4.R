library(ggplot2)
library(readr)

last4Months <- read_csv("E:/WORK/NOVEMBER/05.11.23(Problem solve)/last4Months.csv")
last4Months$WeekDay <- as.factor(last4Months$WeekDay)

ggplot(data = last4Months, mapping = aes_string(x = "Month", y = colnames(last4Months)[4])) + 
  geom_point(aes(color = Month), size = 1.5, position = "jitter") + 
  geom_point(aes(size = DayNr, color = Month)) +
  scale_shape_manual(values = c(1, 2, 3, 4, 5)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#FC4E07", "blue", "red"))+
  
  facet_wrap(~WeekDay, ncol = 3) + 
  scale_x_discrete(labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")) +
  theme(
    plot.title = element_text(size = rel(1)), 
    legend.title = element_text(size = rel(1)), 
    legend.position = "top",
    plot.margin = margin(r=0.5, t=0.5, l=0.5, b=0.5, "cm")  # Adjust the plot margins
  ) +
  guides(x = guide_axis(angle = 30), color = "none") +
  coord_cartesian(clip = "off")
