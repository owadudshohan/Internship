# Load necessary libraries
library(ggraph)
library(tidygraph)
library(tidyverse)

# Create nodes
nodes <- tibble(
  id = 1:10,
  class = sample(letters[1:4], 10, replace = TRUE),
  name = c("Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Henry", "Ivy", "Jack")
)

# Create edges
edges <- tibble(
  from = sample(1:10, 15, replace = TRUE),
  to = sample(1:10,15, replace = TRUE),
  weight = runif(15, min = 1, max = 15)
)

# Create a graph
graph <- tbl_graph(nodes = nodes, edges = edges, directed = FALSE)

# Visualize the graph
ggraph(graph, layout = "stress") + 
  geom_edge_link(
    aes(edge_alpha = weight),
    arrow = arrow(), 
    start_cap = circle(5, "mm"),
    end_cap = circle(5, "mm")
  ) + 
  geom_node_point(aes(colour = class), size = 10) +
  geom_node_text(aes(label = name), vjust = 0.5, hjust = 0.5)
