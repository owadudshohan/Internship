library(ggplot2)
base <- ggplot(mpg2, aes(displ, hwy)) + 
  geom_blank() + 
  xlab(NULL) + 
  ylab(NULL)

base + facet_wrap(~class, ncol = 3, as.table = FALSE)
#as.table = FALSE can help create a more compact and space-efficient layout.
