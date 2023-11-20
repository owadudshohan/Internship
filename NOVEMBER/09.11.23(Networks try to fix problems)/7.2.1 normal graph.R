library(ggraph)
#used for creating interactive and aesthetically pleasing graph visualizations.
library(tidygraph)
#working with graph data in a tidy format. represend nodes and edges.
data(highschool, package = "ggraph")
head(highschool)
#head(highschool): Displays the first few rows of the "highschool" dataset to get a sense of its structure and contents.
hs_graph <- as_tbl_graph(highschool, directed = FALSE)
#Converts the "highschool" dataset into a tidygraph object named "hs_graph." The as_tbl_graph function is used for this purpose. 
#The directed = FALSE argument indicates that the graph is undirected, meaning that there are no arrows or directional edges in the graph.
ggraph(hs_graph) + 
  #creating a graph visualization using the "hs_graph" tidygraph object.
  geom_edge_link() + 
  #The geom_edge_link function is used to draw lines connecting the nodes in the graph.
  geom_node_point()
#The geom_node_point function is used to represent the individual nodes in the graph as points.