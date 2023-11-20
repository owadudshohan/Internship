library(ggraph)
library(tidygraph)
library(tidyverse)

hotel_names <- tibble(
  id = 1:8,
  hotel_name = c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F", "Hotel G", "Hotel G")
)

hotel_prices <- tibble(
  id = 1:8,
  price = c("Tk 20000", "Tk 1800", "Tk 1700", "Tk 1400", "Tk 1300", "Tk 1900", "Tk 1350", "Tk 1650")
)

hotel_reviews <- tibble(
  id = 1:8,
  review = c("8", "6", "7", "4", "3", "8", "5", "2")
)

connections <- data.frame(
  from = c("Hotel A", "Hotel C", "Hotel E", "Hotel G", "Hotel D"),
  to = c("Hotel B", "Hotel D", "Hotel F", "Hotel G", "Hotel C")
)

unique_hotels <- unique(c(connections$from, connections$to))

# Create a mapping of hotel names to IDs
id_mapping <- hotel_names %>%
  filter(hotel_name %in% unique_hotels) %>%
  arrange(match(hotel_name, unique_hotels))

# Create edges using the mapping
edges <- connections %>%
  mutate(from_id = id_mapping$id[match(from, id_mapping$hotel_name)],
         to_id = id_mapping$id[match(to, id_mapping$hotel_name)])

# Create the graph
graph <- tbl_graph(nodes = hotel_names, edges = edges, directed = TRUE)

# Visualize the graph with arrows
ggraph(graph, layout = "stress") + 
  geom_edge_link(arrow = arrow(), 
                 start_cap = circle(5, "mm"),
                 end_cap = circle(5, "mm")) + 
  geom_node_point(size = 10) +
  geom_node_text(aes(label = hotel_name), vjust = 0.5, hjust = 0.5)
