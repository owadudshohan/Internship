library(tidygraph)
library(igraph)
library(ggraph)
library(tibble)

# Create nodes
nodes <- tibble(id = 1:10, label = c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F", "Hotel G", "Hotel H", "Hotel I", "Hotel J"))

# Specify edges
edges <- tibble(
  from = c(4, 4, 4, 4, 4, 4, 4, 4, 4),
  to = c(1, 2, 3, 5, 6, 7, 8, 9, 10),
  rating = c(2, 3, 4, 6, 8, 7, 9, 5, 3)  # Use 'rating' instead of 'label'
)

# Create a tidygraph
graph <- tbl_graph(nodes = nodes, edges = edges)
prices <- c("Tk 2000", "Tk 1800", "Tk 1700", "Tk 1400", "Tk 1300", "Tk 1900", "Tk 1350", "Tk 1650", "Tk 1350", "Tk 1650")

# Add edge_size and layout
E(graph)$edge_size <- edges$rating
layout <- layout_with_kk(graph, weights = E(graph)$edge_size)

# Plot the graph without legend
ggraph(graph, layout = layout) +
  geom_edge_link(aes(label = rating, vjust = 0.6, hjust = -0.7, color = "darkorange"), 
                 show.legend = FALSE,  # hide legend
                 start_cap = circle(5, "mm"),
                 end_cap = circle(5, "mm")) +
  geom_node_point(aes(color = as.factor(id)), size = 19) +
  geom_node_text(aes(label = label), vjust = 0.5, hjust = 0.5, size = 3) +
  geom_node_text(aes(label = prices), vjust = 2, hjust = 0.5, size = 3, color = "black") +
  theme_void() +
  theme(
    plot.margin = margin(0.5, 0.5, 0.5, 0.5, "cm"),
    legend.position = "none"  # hide legend
  )
