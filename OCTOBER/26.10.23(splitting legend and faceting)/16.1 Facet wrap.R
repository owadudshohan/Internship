library(ggplot2)
base <- ggplot(mpg2, aes(displ, hwy)) + 
  geom_blank() + 
  #geom_blank(): This function is used to add blank (empty) geoms to the plot.
  xlab(NULL) + 
  ylab(NULL)

base + facet_wrap(~class, ncol = 3)
#The ~class argument indicates that the data should be split into facets based on the "class" variable. 
