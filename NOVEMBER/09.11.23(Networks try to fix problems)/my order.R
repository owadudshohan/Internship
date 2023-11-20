# Load necessary libraries
library(ggraph)
library(tidygraph)
library(tidyverse)

# Create nodes with fixed names and class letters
nodes <- tibble(
  id = 1:10,
  class = sample(letters[1:10], 10, replace = FALSE),
  name = c("Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Henry", "Ivy", "Jack")
)

# Ensure there are enough unique node pairs for edges without replacement
if (nrow(nodes) < 2) stop("Not enough nodes for edges without replacement")

# Create edges without replacement
edges <- crossing(from = 1:10, to = 1:10) %>%
  filter(from != to) %>%
  sample_n(15) %>%
  mutate(weight = runif(15, min = 1, max = 15))

# Create a graph
graph <- tbl_graph(nodes = nodes, edges = edges, directed = FALSE)

# Define custom colors for each class letter
class_colors <- c("a" = "red", "b" = "blue", "c" = "green", "d" = "purple", "e" = "orange",
                  "f" = "cyan", "g" = "magenta", "h" = "yellow", "i" = "brown", "j" = "darkorange")

# Visualize the graph with custom colors for each class
ggraph(graph, layout = "stress") + 
  geom_edge_link(
    aes(edge_alpha = weight),
    arrow = arrow(), 
    start_cap = circle(5, "mm"),
    end_cap = circle(5, "mm")
  ) + 
  geom_node_point(aes(colour = class), size = 10) +
  geom_node_text(aes(label = name), vjust = 0.5, hjust = 0.5) +
  scale_color_manual(values = class_colors)
