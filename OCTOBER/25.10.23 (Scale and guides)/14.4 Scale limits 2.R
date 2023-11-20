library(ggplot2)
df <- data.frame(x = 1:6, y = 8:13)
base <- ggplot(df, aes(x, y)) + 
  geom_col(aes(fill = x)) +                    # bar chart
  geom_vline(xintercept = 3.5, colour = "red") # for visual clarity only

base
base + scale_fill_gradient(limits = c(1, 3))

#scale_fill_gradient(): This is a function controls the color mapping 