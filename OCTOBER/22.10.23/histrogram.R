library(ggplot2)
ggplot(mpg, aes(x = displ)) +
  geom_histogram()
#Visualise the distribution of a single continuous variable by dividing the x axis into bins 
#and counting the number of observations in each bin