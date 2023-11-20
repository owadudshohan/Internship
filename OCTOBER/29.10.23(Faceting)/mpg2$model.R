library(ggplot2)
mpg2$model <- reorder(mpg2$model, mpg2$cty)
mpg2$manufacturer <- reorder(mpg2$manufacturer, -mpg2$cty)#the 'manufacturer' variable based on the negative of 'cty'. This will reorder 'manufacturer' levels in descending order of 'cty' values.
#for better visualization of data sometimes we need to reorder them in increasing and decreasing order
#reorders its levels based on the values of a second variable, usually numeric

ggplot(mpg2, aes(cty, model)) + 
  geom_point() + 
  facet_grid(manufacturer ~ ., scales = "free", space = "free") +
  #space = "free": The facets are adjusted to accommodate the data, allowing for variations in facet size.
  theme(strip.text.y = element_text(angle = 0))
#setting the text angle to 0 degrees. This ensures that the labels are not rotated and displayed horizontally.