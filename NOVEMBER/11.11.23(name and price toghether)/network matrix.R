# Install and load required packages
if (!requireNamespace("network", quietly = TRUE)) {
  install.packages("network")
}

if (!requireNamespace("networkD3", quietly = TRUE)) {
  install.packages("networkD3")
}

# Load the packages
library(network)
library(networkD3)

# Create the bipartite network
bip <- network(data.frame(event1 = c(1, 2, 1, 0),
                          event2 = c(0, 0, 3, 0),
                          event3 = c(1, 1, 0, 4),
                          row.names = letters[1:4]),
               matrix.type = "bipartite",
               ignore.eval = FALSE,
               names.eval = "weights")

# Plot the bipartite network using ggnet2
ggnet2(bip, label = TRUE)
