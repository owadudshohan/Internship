ggplot(diamonds, aes(carat, color=cut)) +
  geom_histogram(binwidth = 0.2)