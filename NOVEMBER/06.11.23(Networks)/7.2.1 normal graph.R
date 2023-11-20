library(ggraph)
library(tidygraph)
data(highschool, package = "ggraph")
head(highschool)
#head(highschool): Displays the first few rows of the "highschool" dataset to get a sense of its structure and contents.
hs_graph <- as_tbl_graph(highschool, directed = FALSE)
ggraph(hs_graph) + 
  geom_edge_link() + 
  geom_node_point()