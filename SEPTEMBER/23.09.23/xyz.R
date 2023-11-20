library(nycflights13)
library(tidyverse)

table <- filter(flights, month == 1, dep_delay < 0)
month <- table[[2]]
ggplot(data = table) + 
  geom_point(mapping = aes(x = table[[3]], y = table[[11]]))