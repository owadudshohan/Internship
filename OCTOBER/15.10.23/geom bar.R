ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = depth))

#categorical data with precomputed counts, you might use geom_bar

#ggplot(data = diamonds) +
  #geom_col(mapping = aes(x = cut, y= color))

#geom_bar() is typically used for counting and visualizing the frequency of categories, 
 # while geom_col() is used when you have precomputed heights for the bars and want to directly use those values