library(ggplot2)
df <- data.frame(x = 1:4, y = 1:4, z = c("a", "a", "b", "b"))
base_f <- ggplot(df, aes(x, y)) + geom_point() + facet_wrap(~z)
base_f + theme(panel.spacing = unit(0.5, "in"))
