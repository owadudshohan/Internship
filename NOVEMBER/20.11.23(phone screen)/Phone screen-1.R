library(tidygraph)
library(igraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)

hotelName <- c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E")
targetHotel <- "Hotel D"
rating <- c(2, 4, 6, 3)
rowIndexOfTargetHotel <- which(hotelName == targetHotel)
nodes <- tibble(id = 1:NROW(hotelName), label = hotelName)
price <- c("Tk 2000", "Tk 1800", "Tk 1700", "Tk 1400", "Tk 1300")
# Add edge_size and layout

E(graph)$edge_size <- edges$rating
layout <- layout_with_kk(graph, weights = E(graph)$edge_size)

# Kamada-Kawai algorithm organizes nodes in a graph match the distances between them.
# Define the desired rating values
desired_ratings <- c("r-2.5", "r-3", "r-4", "r-6")


  nodes$node_color <- ifelse(nodes$label == targetHotel, "red", "blue")

# Plotting using ggplot2 with updated node coloring
ggraph(graph, layout = layout) +
  geom_edge_link(aes(label = desired_ratings, vjust = 0.6, hjust = -0.7, color = "darkorange"), 
                 show.legend = FALSE,
                 start_cap = circle(5, "mm"),
                 end_cap = circle(5, "mm")) +
  geom_node_point(aes(color = node_color), size = 20) +
  geom_node_text(aes(label = str_wrap(nodes$label, width = 12)), vjust = 0.2, hjust = 0.5, size = 2.5) +
  geom_node_text(aes(label = prices), vjust = 2, hjust = 0.5, size = 3, color = "black") +
  theme_void() +
  theme(
    plot.margin = margin(1, 1, 1, 1, "cm"),
    legend.position = "none"
  )