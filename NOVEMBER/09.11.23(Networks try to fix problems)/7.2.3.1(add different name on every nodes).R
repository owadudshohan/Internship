library(ggraph)
library(tidygraph)

# Generate a graph
graph <- play_erdos_renyi(n = 10, p = 0.2) %>% 
  activate(nodes) %>% 
  mutate(class = sample(letters[1:4], n(),replace = TRUE),
         name = c("Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Henry", "Ivy", "Jack")) %>%
  
  activate(edges) %>% 
  arrange(.N()$class[from])

# Create a graph visualization
ggraph(graph, layout = "stress") + 
  geom_edge_link(
    arrow = arrow(), 
    start_cap = circle(5, "mm"),
    end_cap = circle(5, "mm")
  ) + 
  geom_node_point(aes(colour = class), size = 10) +
  geom_node_text(aes(label = name), vjust = 0.5, hjust=0.5)
