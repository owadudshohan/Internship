library(ggraph)
library(tidygraph)

graph <- play_erdos_renyi(n = 10, p = 0.2) %>% 
  #It generates a random graph with 10 nodes using the Erdos-Renyi model, where each pair of nodes has a 0.2 probability of being connected.
  #Erdős–Rényi model refers to one of two closely related models for generating random graphs
  activate(nodes) %>% 
  #pipe operator (%>%) is used to pass the result of the left side to the next function on the right side.
  mutate(class = sample(letters[1:4], n(), replace = TRUE)) %>% 
  #mutate is a function that adds new variables or modifies existing ones
  activate(edges) %>% 
  arrange(.N()$class[from])
#It activates the edges in the graph and arranges them based on the class of the "from" node.

ggraph(graph, layout = "stress") + 
  geom_edge_link(aes(alpha = after_stat(index)))
#aes(alpha = after_stat(index)) sets the transparency (alpha) of the edges based on their index.