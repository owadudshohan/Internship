# Load necessary libraries
library(ggraph)
library(tidygraph)
library(tidyverse)

# Create nodes
nodes <- tibble(
  id = 1:10,
  class = sample(letters[1:10], 10, replace = FALSE),
  name = c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F", "Hotel G", "Hotel G", "Hotel H", "Hotel I", "Hotel J")
)

# Specify connections
connections <- data.frame(
  from = c("Hotel A", "Hotel C", "Hotel E", "Hotel G", "Hotel D"),
  to = c("Hotel B", "Hotel D", "Hotel F", "Hotel G", "Hotel C")
)

# Find corresponding IDs for connections
connection_ids <- nodes %>%
  filter(name %in% c(connections$from, connections$to)) %>%
  pull(id)

# Create edges for the specified connections
edges <- tibble(from = rep(connection_ids[1:5], each = 2), to = rep(connection_ids[6:10], times = 2))

# Create the graph
graph <- tbl_graph(nodes = nodes, edges = edges, directed = TRUE)

# Visualize the graph with arrows
ggraph(graph, layout = "stress") + 
  geom_edge_link(arrow = arrow(), 
                 start_cap = circle(5, "mm"),
                 end_cap = circle(5, "mm")) + 
  geom_node_point(aes(colour = class), size = 10) +
  geom_node_text(aes(label = name), vjust = 0.5, hjust = 0.5)
