library(tidygraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)

# Define the new data
hotelName <- c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F", "Hotel G", "Hotel H", "Hotel I", "Hotel J")
targetHotel <- "Hotel D"
rowIndexOfTargetHotel <- which(hotelName == targetHotel)

# Create nodes tibble
nodes <- tibble(id = 1:length(hotelName), label = hotelName)

# Create edges tibble (assuming you want to connect all hotels to the target hotel)
edges <- tibble(
  from = rep(rowIndexOfTargetHotel, length(hotelName) - 1),
  to = setdiff(1:length(hotelName), rowIndexOfTargetHotel),
  rating = c(2, 4, 6, 3, 8, 7, 9, 5, 3)
)

# Create a tidygraph
graph <- tbl_graph(nodes = nodes, edges = edges)

# Prices data
prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500", "Tk 1300")

# Add edge_size and layout
E(graph)$edge_size <- edges$rating
layout <- layout_with_kk(graph, weights = E(graph)$edge_size)



# Specify the desired_ratings vector
desired_ratings <- c("r-2.5", "r-4", "r-6", "r-3", "r-8", "r-7", "r-9", "r-5.5", "r-3")

# Plotting using ggplot2
ggraph(graph, layout = layout) +
  geom_edge_link(aes(label = desired_ratings, vjust = 0.6, hjust = -0.7, color = "darkorange"), 
                 show.legend = FALSE,
                 start_cap = circle(5, "mm"),
                 end_cap = circle(5, "mm")) +
  geom_node_point(aes(color = as.factor(id)), size = 20) +
  geom_node_text(aes(label = str_wrap(nodes$label, width = 12)), vjust = 0.2, hjust = 0.5, size = 2.5) +
  geom_node_text(aes(label = prices), vjust = 2, hjust = 0.5, size = 3, color = "black") +
  theme_void() +
  theme(
    plot.margin = margin(1, 1, 1, 1, "cm"),
    legend.position = "none"
  )
