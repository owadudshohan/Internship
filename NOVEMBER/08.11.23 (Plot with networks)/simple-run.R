library(ggraph)
library(tidygraph)
rstat_nodes <- data.frame(name = c("Hadley", "David", "Romain", "Julia"))
rstat_edges <- data.frame(from = c(1, 1, 1, 2, 3, 3, 4, 4, 4),
                          to = c(2, 3, 4, 1, 1, 2, 1, 2, 3))
tbl_graph(nodes = rstat_nodes, edges = rstat_edges)