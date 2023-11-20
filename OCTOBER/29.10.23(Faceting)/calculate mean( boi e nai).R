library(ggplot2)
# Generate 'y' values with different means
y <- rnorm(120, c(1, 2, 1))

# Calculate the mean for each group
mean_group_1 <- mean(y[1:40])
mean_group_2 <- mean(y[41:80])
mean_group_3 <- mean(y[81:120])

# Print the means for each group
cat("Mean for Group 1:", mean_group_1, "\n")
cat("Mean for Group 2:", mean_group_2, "\n")
cat("Mean for Group 3:", mean_group_3, "\n")
