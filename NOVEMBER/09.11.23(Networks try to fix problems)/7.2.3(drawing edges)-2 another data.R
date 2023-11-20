library(ggraph)
library(tidygraph)

graph %>% 
  #the pipe (%>%) to take the graph and focus on its nodes.
  activate(nodes) %>% 
  mutate(centrality = centrality_pagerank()) %>% 
#centrality_pagerank() function calculates the PageRank centrality for each node. PageRank is a measure of a node's importance in a network.
  arrange(desc(centrality))
#It arranges the nodes in descending order based on their centrality.
#This means nodes with higher PageRank centrality will come first.

ggraph(graph, layout = "stress") + 
  geom_edge_link(aes(alpha = after_stat(index)))