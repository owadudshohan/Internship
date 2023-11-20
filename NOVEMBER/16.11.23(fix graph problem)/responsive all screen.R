library(tidygraph)
library(igraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)

# Create nodes
nodes <- tibble(id = 1:10, label = c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla", "Hotel J bla  bla bla"))

# Specify edges
edges <- tibble(
  from = c(4, 4, 4, 4, 4, 4, 4, 4, 4),
  to = c(1, 2, 3, 5, 6, 7, 8, 9, 10),
  rating = c(2, 3, 4, 6, 8, 7, 9, 5, 3)  # Use 'rating' instead of 'label'
)

# Create a tidygraph
graph <- tbl_graph(nodes = nodes, edges = edges)
prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500", "Tk 1300")

# Add edge_size and layout
E(graph)$edge_size <- edges$rating
layout <- layout_with_kk(graph, weights = E(graph)$edge_size)

# Kamada-Kawai algorithm organizes nodes in a graph match the distances between them.
# Define the desired rating values
desired_ratings <- c("r-2.5", "r-3", "r-4", "r-6", "r-8", "r-7", "r-9", "r-5.5", "r-3")

# Specify the desired width and height for the plot in inches
plot_width <- 10
plot_height <- 6

# Save the plot as a PNG file with the specified dimensions
g <- ggraph(graph, layout = layout) +
  geom_edge_link(aes(label = desired_ratings, vjust = 0.6, hjust = -0.7, color = "darkorange"), 
                 show.legend = FALSE,
                 start_cap = circle(5, "mm"),
                 end_cap = circle(5, "mm")) +
  geom_node_point(aes(color = as.factor(id)), size = 20) +
  geom_node_text(aes(label = str_wrap(label, width = 12)), vjust = 0.2, hjust = 0.5, size = 2.5) +
  geom_node_text(aes(label = prices), vjust = 2, hjust = 0.5, size = 3, color = "black") +
  theme_void() +
  theme(
    plot.margin = margin(1, 1, 1, 1, "cm"),
    legend.position = "none"
  )

ggsave("responsive_plot.png", g, width = plot_width, height = plot_height, units = "in", dpi = 300)
