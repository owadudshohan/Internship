# Load necessary libraries
library(ggraph)
library(tidygraph)
library(tidyverse)

# Create nodes with fixed names and class letters
nodes <- tibble(
  id = 1:10,
  class = sample(letters[1:10], 10, replace = FALSE),
  name = c("Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Henry", "Ivy", "Jack"),
  direction = c("out", "in", "out", "in", "out", "in", "out", "in", "out", "in")
)

# Ensure there are enough unique node pairs for edges without replacement
if (nrow(nodes) < 2) stop("Not enough nodes for edges without replacement")

# Create edges without replacement
edges <- crossing(from = 1:10, to = 1:10) %>%
  filter(from != to) %>%
  sample_n(15)

# Find all combinations of node pairs
all_node_combinations <- combn(nodes$id, 2, simplify = TRUE)

# Create edges for all combinations
new_edges <- tibble(from = all_node_combinations[1, ], to = all_node_combinations[2, ])

# Add the new edges to the existing edges dataframe
edges <- bind_rows(edges, new_edges)

# Create the graph with the updated edges
graph <- tbl_graph(nodes = nodes, edges = edges, directed = FALSE)

# Visualize the updated graph
ggraph(graph, layout = "stress") + 
  geom_edge_link(
    arrow = arrow(type = ifelse(nodes$direction == "out", "closed", "closed")),
    start_cap = circle(5, "mm"),
    end_cap = circle(5, "mm")
  ) + 
  geom_node_point(aes(colour = class), size = 10) +
  geom_node_text(aes(label = name), vjust = 0.5, hjust = 0.5)
