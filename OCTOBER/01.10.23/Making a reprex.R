# Create the 'mydata' data frame
mydata <- structure(
  list(
    x = 1:5,
    y = structure(1:5, .Label = c("a", "b", "c", "d", "e"), class = "factor")
  ),
  class = "data.frame",
  row.names = c(NA, -5L)
)

# Print the 'mydata' data frame
print(mydata)



