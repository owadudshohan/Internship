library(ggplot2)
p <- ggplot(mpg1, aes(cty, hwy)) + 
  geom_abline(slope = 0, intercept = 20) +
  #slope = 0, intercept = 20
  #This line adds a straight line to the plot using the geom_abline() function. By default, this line will 
  #have a slope of 1 and an intercept of 0, creating a 45-degree diagonal reference line.
  geom_jitter(width = 0.1, height = 0.1)

p + facet_wrap(~cyl)
#it uses the facet_wrap() function to create separate plots for each unique value in the 'cyl' column of the 'mpg2' dataset.