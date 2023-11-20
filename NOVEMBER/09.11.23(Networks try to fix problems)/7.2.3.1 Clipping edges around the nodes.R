library(ggraph)
library(tidygraph)

# graph <- play_erdos_renyi(n = 10, p = 0.2) %>% 
#   activate(nodes) %>% 
#   mutate(class = sample(letters[1:4], n(), replace = TRUE)) %>% 
#   activate(edges) %>% 
#   arrange(.N()$class[from])
# Create nodes
nodes <- tibble(id = 1:10, name = letters[1:10])

# Specify edges
edges <- tibble(from = c(1, 2, 3, 4, 5), to = c(6, 7, 8, 9, 10))

# Create a tidygraph
graph <- as_tbl_graph(nodes, edges) %>% 
     activate(nodes) %>% 
     mutate(class = sample(letters[1:4], n(), replace = TRUE)) %>% 
     activate(edges) %>% 
     arrange(.N()$class[from])

ggraph(graph, layout = "stress") + 
  geom_edge_link(arrow = arrow()) + 
  geom_node_point(aes(colour = class), size = 8)