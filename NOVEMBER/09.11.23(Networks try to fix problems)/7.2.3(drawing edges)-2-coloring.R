library(ggraph)
library(tidygraph)

graph <- play_erdos_renyi(n = 10, p = 0.2) %>% 
  activate(nodes) %>% 
  mutate(class = sample(letters[1:4], n(), replace = TRUE)) %>% 
  activate(edges) %>% 
  arrange(.N()$class[from])

ggraph(graph, layout = "stress") + 
  geom_edge_link2(
    aes(colour = node.class), 
    width = 3,
    lineend = "round")