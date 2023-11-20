library(ggplot2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#facet_wrap takes a single categorical variable and creates a 1D grid of facets.
#facet_grid takes two categorical variables, one for the rows and one for the columns, and creates a 2D grid of facets.