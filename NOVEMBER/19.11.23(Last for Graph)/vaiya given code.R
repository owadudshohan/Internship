library(tidygraph)
library(igraph)
library(ggraph)
library(tibble)

# Create nodes
hotelName = c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E")
targetHotel = "Hotel D"
rating = c(2, 4, 6, 3)
rowIndexOfTargetHotel = rowIndex(targetHotel)
nodes <- tibble(id = 1:NROW(hotelName), label = hotelName)
price <- c("Tk 2000", "Tk 1800", "Tk 1700", "Tk 1400", "Tk 1300")

# Specify edges
edges <- tibble(
  from = repeat(rowIndexOfTargetHotel NROW(nodeName) - 1),
  to = intersect(rowIndexOfAllHotel(hotelName) - rowIndexOfTargetHotel),
  label = rating  # Add labels for each edge
)

# Create a tidygraph
graph <- tbl_graph(nodes = hotelName, edges = edges, directed = TRUE)
prices <- price