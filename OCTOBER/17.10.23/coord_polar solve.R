library(ggplot2)

bar <- ggplot(data = mpg) +
  geom_bar(
    mapping = aes(x = factor(cyl), fill = factor(cyl), group = factor(cyl)),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = "category", y = "value")

bar + coord_polar()
 
# When you create a bar plot and use geom_bar with a fill aesthetic, ggplot2 automatically groups the data by the fill 
# aesthetic to determine the fill colors for the bars. If cyl is treated as a numerical variable, ggplot2 might have 
# trouble automatically inferring how to group the data for the fill aesthetics. By converting it into a factor 
# variable, you are explicitly specifying the grouping structure, which ensures that ggplot2 can create the polar 
# coordinates correctly.