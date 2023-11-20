library(igraph)
library(tidyverse)

# Your original data for hotel names
hotel_names <- tibble(
  id = 1:8,
  hotel_name = c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F", "Hotel G", "Hotel G")
)

# Your original connections data
connections <- data.frame(
  from = c("Hotel A", "Hotel C", "Hotel E", "Hotel G", "Hotel D"),
  to = c("Hotel B", "Hotel D", "Hotel F", "Hotel G", "Hotel C")
)

# Create a combined set of unique vertices
all_vertices <- unique(c(connections$from, connections$to))

# Create a data frame with unique vertex IDs
vertex_ids <- tibble(
  id = 1:length(all_vertices),
  hotel_name = all_vertices
)

# Create the graph using igraph
graph <- graph_from_data_frame(connections, vertices = vertex_ids, directed = TRUE)

# Visualize the graph with arrows
plot(graph, layout = layout_in_circle(graph), edge.arrow.size = 0.5, vertex.label.dist = 1, vertex.label.cex = 1.5)
