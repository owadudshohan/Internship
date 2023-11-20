library(ggplot2)
demo <- data.frame(
  cut = c("Fair", "Good", "Very Good", "Premium", "Ideal"),
  freq = c(1610, 4906, 12082, 13791, 21551)
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
