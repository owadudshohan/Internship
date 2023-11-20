library(ggplot2)
ggplot(economics_long, aes(date, value)) + 
  geom_line() + 
  facet_wrap(~variable, scales = "free_y", ncol = 2)