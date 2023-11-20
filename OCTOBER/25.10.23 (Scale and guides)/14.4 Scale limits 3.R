library(ggplot2)
df <- data.frame(x = 1:6, y = 8:13)
base <- ggplot(df, aes(x, y)) + 
  geom_col(aes(fill = x)) +                    # bar chart
  geom_vline(xintercept = 3.5, colour = "red") # for visual clarity only

base
base + scale_fill_gradient(limits = c(1, 3), oob = scales::squish)

#oob = scales::squish: This part specifies how to handle values that are out of bounds.
#scales::squish is a method that squishes the out-of-bounds values to the nearest limit. 