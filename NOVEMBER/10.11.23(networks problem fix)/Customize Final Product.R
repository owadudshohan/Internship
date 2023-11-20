library(tidygraph)
library(igraph)
#In the given code, igraph is used to create a graph (tbl_graph), set up edges and vertices
library(ggraph)
#ggraph is a powerful and flexible tool for creating aesthetically pleasing and customizable graph visualizations in R, especially when working with graphs generated using the igraph package.
library(tibble)

# Create nodes
nodes <- tibble(id = 1:10, label = c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F", "Hotel G", "Hotel H", "Hotel I", "Hotel J"))

# Specify edges
edges <- tibble(
  from = c(4, 4, 4, 4, 4, 4, 4, 4, 4),
  to = c(1, 2, 3, 5, 6, 7, 8, 9, 10),
  label = c("r-2", "r-3", "r-4", "r-6", "r-8", "r-7", "r-9", "r-5", "r-3")  # Add labels for each edge
)

# Create a tidygraph
graph <- tbl_graph(nodes = nodes, edges = edges, directed = TRUE)
prices <- c("Tk 2000", "Tk 1800", "Tk 1700", "Tk 1400", "Tk 1300", "Tk 1900", "Tk 1350", "Tk 1650", "Tk 1350", "Tk 1650")

# Add edge_size and layout
E(graph)$edge_size <- c(2, 3, 4, 6, 8, 7, 9, 5, 3)
layout <- layout_with_kk(graph, weights = E(graph)$edge_size)

# Plot the graph
ggraph(graph, layout = layout) +
  geom_edge_link(aes(label = label, vjust = -1.2,hjust = -0.1, color="darkorange"), 
                 start_cap = circle(5, "mm"),
                 end_cap = circle(5, "mm")) +
  geom_node_point(aes(color = as.factor(id)), size = 15) +
  geom_node_text(aes(label = label), vjust = 0.5, hjust = 0.5, size = 3) +
  geom_node_text(aes(label = prices), vjust = -3, hjust = 1, size = 4, color="darkblue") +
  theme_void() +
  scale_color_discrete(name = "Hotels", labels = c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F", "Hotel G", "Hotel H", "Hotel I", "Hotel J")) +
  theme(
    plot.margin = margin(0.5, 0.5, 0.5, 0.5, "cm")
  )
