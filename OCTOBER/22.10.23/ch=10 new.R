library(ggplot2)

theme_set(theme_minimal())

mpg_plot <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point() +
  facet_wrap(vars(year)) +
  lims(x = c(1, 7), y = c(10, 45))

print(mpg_plot)
