library(ggplot2)
base <- ggplot(mpg, aes(cty, hwy, color = factor(cyl))) +
  #factor specify the category of data set( mane koy category er data ache ta define kore day)
  geom_jitter() + 
  geom_abline(colour = "darkorange", linewidth = 2)
#This line adds a straight line to the plot using the geom_abline() function. By default, this line will 
#have a slope of 1 and an intercept of 0, creating a 45-degree diagonal reference line.

base
