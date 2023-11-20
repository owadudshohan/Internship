library(ggraph)
library(tidygraph)
data(highschool, package = "ggraph")
head(highschool)
hs_graph <- as_tbl_graph(highschool, directed = FALSE)
ggraph(hs_graph, layout = "stress") + 
  geom_edge_link() + 
  geom_node_point(
    aes(filter = centrality_degree() > 2, 
#centrality_degree() is a function that calculates the degree centrality for each node in the graph. Degree centrality is a measure of how many connections (edges) a node has.
#it highlights nodes that have more than 2 connections.
        colour = centrality_power()),
#centrality_power() is another function that calculates power centrality for each node. Power centrality measures the importance of a node in the network by considering not only the number of direct connections but also the importance of the nodes it is connected to.
#colour = centrality_power() sets the color of the nodes based on their power centrality. Nodes with higher power centrality may be assigned different colors than nodes with lower power centrality.
    size = 8
  )