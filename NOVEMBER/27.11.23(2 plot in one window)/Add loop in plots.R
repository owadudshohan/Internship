library(shiny)
library(igraph)
library(tidygraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)

# #For 2 Hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla"),
#   Rating = c("2.5", "4"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250")
# )
# targetHotel <- "Hotel B bla  bla bla"

#For 3 Hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla"),
#   Rating = c("2.5", "4", "6"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350")
# )
# targetHotel <- "Hotel C bla  bla bla"


#For 4 Hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla"),
#   Rating = c("2.5", "4", "6", "7.5"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850")
# )
# targetHotel <- "Hotel D bla  bla bla"


#For 5 Hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla"),
#   Rating = c("2.5", "4", "6", "7.5", "2"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650")
# )
# targetHotel <- "Hotel D bla  bla bla"


#for 6 Hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla"),
#   Rating = c("2.5", "4", "6", "7.5", "2", "8"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850")
# )
# targetHotel <- "Hotel D bla  bla bla"

#for 7 hotels
hotelInfo <- tibble(
  hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla"),
  Rating = c("2.5", "4", "6", "7.5", "2", "8", "7"),
  priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800"),
  priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800"),
  priceTripleRoom = c("Tk 4200", "Tk 6250", "Tk 8350", "Tk 8850", "Tk 9650", "Tk 7850", "Tk 9800")
)
targetHotel <- "Hotel D bla  bla bla"

#for 8 hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla",  "Hotel H bla  bla bla"),
#   Rating = c("2.5", "4", "6", "7.5", "3", "8", "7", "9"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800", "Tk 6500")
# )
# targetHotel <- "Hotel D bla  bla bla"

#for 9 hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla",  "Hotel H bla  bla bla", "Hotel I bla  bla bla"),
#   Rating = c("2.5", "4", "6", "7.5", "3", "8", "7", "9", "5"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800", "Tk 6500", "Tk 3500")
# )
# targetHotel <- "Hotel D bla  bla bla"

#for 10 hotels
# hotelInfo <- tibble(
#   hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla",  "Hotel H bla  bla bla", "Hotel I bla  bla bla", "Hotel J bla  bla bla"),
#   Rating = c("2.5", "4", "6", "7.5", "3", "8", "7", "9", "5", "4"),
#   priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500", "Tk 1300"),
#   priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800", "Tk 6500", "Tk 3500", "Tk 2600")
# )
# targetHotel <- "Hotel D bla  bla bla"

ui <- fluidPage(
  shiny::tags$head(
    shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=0.5")
  ),
  uiOutput("plot"),
)

server <- function(input, output) {
  generatePlot <- function(targetHotel, priceRoom) {
    rowIndexOfTargetHotel <- which(hotelInfo$hotelName == targetHotel)
    
    edgeRatings <- hotelInfo$Rating[-rowIndexOfTargetHotel]
    
    firstFourWords <- sapply(str_split(hotelInfo$hotelName, "\\s+"), function(words) paste(words[1:4], collapse = " "))
    
    nodes <- tibble(id = 1:length(hotelInfo$hotelName), label = firstFourWords)
    
    edges <- tibble(
      from = rep(rowIndexOfTargetHotel, length(hotelInfo$hotelName) - 1),
      to = setdiff(1:length(hotelInfo$hotelName), rowIndexOfTargetHotel),
      #The to column is created by taking the set difference between the sequence of indices from 1 to the length of 
      #hotelName and the index of the target hotel. This ensures that the target hotel is not connected to itself.
      rating = edgeRatings
    )
    
    graph <- tbl_graph(nodes = nodes, edges = edges)
    #tbl_graph is a function from the tidygraph package that constructs a graph from node and edge data.
    E(graph)$edge_size <- (edges$rating)
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    #E(graph) is used to access the edge data of the graph.
    #$edge_size is used to extract the values in the edge_size column of the edge data.
    #It stands for the Kamada-Kawai layout algorithm. This algorithm is used for arranging the nodes of a graph in a 
    #visually pleasing way, taking into account the distances between nodes.
    
    if(length(hotelInfo$hotelName) <= 3){
      vjust = 1
      hjust = -0.7
    }else if(length(hotelInfo$hotelName) == 4){
      vjust = -1.3
      hjust = -0.5
    }else if(length(hotelInfo$hotelName) == 5){
      vjust = -0.4
      hjust = -0.9
    }else if(length(hotelInfo$hotelName) == 6){
      vjust = -1.3
      hjust = 1.8
    }else if(length(hotelInfo$hotelName) == 7){
      vjust = 1.5
      hjust = 1.5
    }else if(length(hotelInfo$hotelName) == 8){
      vjust = 1.2
      hjust = 1.1
    }else if(length(hotelInfo$hotelName) == 9){
      vjust = 1.2
      hjust = 1.2
    }else if(length(hotelInfo$hotelName) == 10){
      vjust = 1
      hjust = 0.1
    }
    
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating, vjust = vjust, hjust = hjust, color = "darkorange"), 
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm")) +
      geom_node_point(aes(x = layout[, 1], y = layout[, 2], color = as.factor(id)), 
                      size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, 25, 31), ifelse(length(hotelInfo$hotelName) == 2, 23, 25))) +
      geom_text(aes(x = layout[, 1], y = layout[, 2], label = str_wrap(nodes$label, width = 14)), 
                vjust = 0.2, hjust = 0.5, 
                size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, 3, 3.6), ifelse(length(hotelInfo$hotelName) == 2, 2.5, 2.8)),
                check_overlap = TRUE) +
      geom_node_text(aes(label = priceRoom), vjust = 2.7, hjust = 0.5, color = "black", size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, 3, 3.6), ifelse(length(hotelInfo$hotelName) == 2, 2.5, 3.2))) +
      annotate("text", x = layout[rowIndexOfTargetHotel, 1], y = layout[rowIndexOfTargetHotel, 2],
               label = hotelInfo$Rating[rowIndexOfTargetHotel],vjust = 4.6, hjust = 0.5, size = ifelse(length(hotelInfo$hotelName) == 2, 2.8, 3.4), color = "red") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
    
  }
  
  plotTitle <- list("Single Room Plot", "Double Room Plot", "Triple Room Plot", "Family Room Plot")
  
  output$plot <- renderUI({
    lapply(3:length(hotelInfo), function(rowIndex){
      fluidRow(
        style = "display: flex; justify-content: center; align-items: center; height: 100vh;",
        column(
          width = 12, align = "center",
          h3(plotTitle[[rowIndex-2]], align = "center", style = "margin-bottom: 40px;"),  # Added plot title
          renderPlot(generatePlot(targetHotel, hotelInfo[[rowIndex]]) ,height = 600, width = 600)
        )
      )
    })
  })
}

shinyApp(ui, server)