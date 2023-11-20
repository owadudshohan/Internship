library(ggplot2)
library(readr)

# Specify column types when reading the CSV file
col_types <- cols(
  YourXVariable = col_double(),
  YourYVariable = col_double(),
  WeekDay = col_factor(),
  Month = col_factor(),
  DayNr = col_double()
)

last4Months <- read_csv("E:/WORK/NOVEMBER/05.11.23(Problem solve)/last4Months.csv", col_types = col_types)

# Continue with your ggplot code as before

# Continue with your ggplot code as before

last4Months$WeekDay <- as.factor(last4Months$WeekDay)
ggplot(data = last4Months, mapping = aes_string(x = colnames(last4Months)[1], y = colnames(last4Months)[4])) + 
  geom_point(aes(color = Month), size = 0.75) + 
  geom_point(aes(size = DayNr), alpha = 1/3) + 
  facet_wrap(~WeekDay, ncol = 3) + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12)) +
  scale_x_discrete(labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
  theme(
    plot.title = element_text(size = rel(1)), 
    legend.title = element_text(size = rel(1)), 
    legend.position = "top",
  ) +
  guides(x = guide_axis(angle = 30), color = "none")