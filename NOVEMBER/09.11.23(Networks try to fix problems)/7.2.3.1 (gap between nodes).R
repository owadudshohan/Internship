library(ggraph)
library(tidygraph)

graph <- play_erdos_renyi(n = 10, p = 0.2) %>% 
  activate(nodes) %>% 
  mutate(class = sample(letters[1:4], n(), replace = TRUE)) %>% 
  activate(edges) %>% 
  arrange(.N()$class[from])

ggraph(graph, layout = "stress") + 
  geom_edge_link(
    arrow = arrow(), 
    start_cap = circle(5, "mm"),
    end_cap = circle(5, "mm")
  ) + 
  geom_node_point(aes(colour = class), size = 8)