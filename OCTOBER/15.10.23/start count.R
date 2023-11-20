library(ggplot2)
ggplot(data = diamonds)+
  stat_count(mapping=aes(x=depth))
# used raw data and need to compute counts, you can use stat_count
