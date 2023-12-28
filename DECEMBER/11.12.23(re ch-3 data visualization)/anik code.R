library(shiny)
library(igraph)
library(tidygraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)


ui <- fluidPage(
  shiny::tags$head(
    shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=0.5")
  ),
  uiOutput("plot"),
)

server <- function(input, output) {
  
  #CSv file connect
  data <- read.csv("E:/WORK/HOTEL DATA/4-star hotel in Riga.csv")
  data1 <- read.csv("E:/WORK/HOTEL DATA/4 star hotel in Vienna.csv")
  data2 <- read.csv("E:/WORK/HOTEL DATA/4-star hotel in Amsterdam.csv")
  
  
  #for Riga 
  # hotelInfo <- tibble(
  #   hotelName = head(data[data$RoomType == "Single", ]$HotelName,10),
  #   Rating = (head(data[data$RoomType == "Single", ]$Ratings,10)),
  #   priceSingleRoom = head(data[data$RoomType == "Single", ]$X2023.12.06, 10),
  #   priceDoubleRoom = head(data[data$RoomType == "Double", ]$X2023.12.06, 10),
  #   priceTripleRoom = head(data[data$RoomType == "Triple", ]$X2023.12.06, 10),
  # )
  #targetHotel <- "Radisson Blu Daugava Hotel, Riga"
  
  
  #for Vienna
  # hotelInfo <- tibble(
  #   hotelName = head(data1[data1$RoomType == "Single", ]$HotelName,10),
  #   Rating = (head(data1[data1$RoomType == "Single", ]$Ratings,10)),
  #   priceSingleRoom = head(data1[data1$RoomType == "Single", ]$X2023.12.06, 10),
  #   priceDoubleRoom = head(data1[data1$RoomType == "Double", ]$X2023.12.06, 10),
  #   priceTripleRoom = head(data1[data1$RoomType == "Triple", ]$X2023.12.06, 10),
  # )
  # targetHotel <- "Hilton Vienna Waterfront"
  
  
  #for Amsterdam
  hotelInfo <- tibble(
    hotelName = head(data2[data2$RoomType == "Single", ]$HotelName,10),
    Rating = (head(data2[data2$RoomType == "Single", ]$Ratings,10)),
    # priceSingleRoom = head(data2[data2$RoomType == "Single", ]$X2023.12.06, 10),
    # priceDoubleRoom = head(data2[data2$RoomType == "Double", ]$X2023.12.06, 10),
    # priceTripleRoom = head(data2[data2$RoomType == "Triple", ]$X2023.12.06, 10),
    
    # priceSingleRoom = as.numeric(bgsu("[^0-9.]", "", head(data2[data2$RoomType == "Single", ]$Price, 10))),
    # priceDoubleRoom = as.numeric(gsub("[^0-9.]", "", head(data2[data2$RoomType == "Double", ]$Price, 10))),
    # priceTripleRoom = as.numeric(gsub("[^0-9.]", "", head(data2[data2$RoomType == "Triple", ]$Price, 10))),
    
    priceSingleRoom = parse_number(head(data2[data2$RoomType == "Single", ]$Price, 10)),
    priceDoubleRoom = parse_number(head(data2[data2$RoomType == "Double", ]$Price, 10)),
    priceTripleRoom = parse_number(head(data2[data2$RoomType == "Triple", ]$Price, 10)),
  )
  #browser()
  targetHotel <- "DoubleTree by Hilton Amsterdam Centraal Station"
  
  
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
    
    if (length(hotelInfo$hotelName) <= 3) {
      vjust = 1
      hjust = -0.7
    } else if (length(hotelInfo$hotelName) == 4) {
      vjust = -1.3
      hjust = -0.5
    } else if (length(hotelInfo$hotelName) == 5) {
      vjust = -0.4
      hjust = -0.9
    } else if (length(hotelInfo$hotelName) == 6) {
      vjust = -1.3
      hjust = 0.8
    } else if (length(hotelInfo$hotelName) == 7) {
      vjust = 1.5
      hjust = 1.5
    } else if (length(hotelInfo$hotelName) == 8) {
      vjust = 1.9
      hjust = 1.2
    } else if (length(hotelInfo$hotelName) == 9) {
      vjust = 1.8
      hjust = 0.9
    } else if (length(hotelInfo$hotelName) == 10) {
      vjust = 1.8
      hjust = -0.6
    }
    
    TargetnodeSizefor2=25
    Neibornodesizefor2=23
    TargetnodeSizeforALL=31
    NeibornodesizeforALL=25
    
    hjustnode=0.5
    
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating, vjust = vjust, hjust = hjust, color = "darkorange"), 
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm")) +
      geom_node_point(aes(x = layout[, 1], y = layout[, 2], color = as.factor(id)), 
                      size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, TargetnodeSizefor2,  TargetnodeSizeforALL), ifelse(length(hotelInfo$hotelName) == 2,  Neibornodesizefor2,  NeibornodesizeforALL ))) +
      geom_text(aes(x = layout[, 1], y = layout[, 2], label = str_wrap(nodes$label, width = 14)), 
                vjust = 0.2, hjust = hjustnode, 
                size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, 3, 3.6), ifelse(length(hotelInfo$hotelName) == 2, 2.5, 2.8)),
                check_overlap = TRUE) +
      geom_node_text(aes(label = priceRoom), vjust = 2.7, hjust = hjustnode, color = "black", size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, 3, 3.6), ifelse(length(hotelInfo$hotelName) == 2, 2.5, 3.2))) +
      annotate("text", x = layout[rowIndexOfTargetHotel, 1], y = layout[rowIndexOfTargetHotel, 2],
               label = hotelInfo$Rating[rowIndexOfTargetHotel],vjust = 4.6, hjust = hjustnode, size = ifelse(length(hotelInfo$hotelName) == 2, 2.8, 3.4), color = "red") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
    
  }
  
  output$plot <- renderUI({
    lapply(3:length(hotelInfo), function(rowIndex){  
      fluidRow(
        style = "display: flex; justify-content: center; align-items: center;",
        column(
          width = 12, align = "center",
          h3(names(hotelInfo)[rowIndex], align = "center", style = "margin-bottom: 40px; margin-top: 50px"), # Added plot title
          
          plotOutput(paste0("plot-",rowIndex), width = "95vw", height = "85vh") #added line
        )
      )
    })
  })
  
  lapply(3:length(hotelInfo), function(rowIndex){   #added line
    output[[paste0("plot-",rowIndex)]] <- renderPlot(generatePlot(targetHotel, hotelInfo[[rowIndex]]))
  })
  
  # for (rowIndex in 3:length(hotelInfo)) {
  #   output[[paste0("plot-",rowIndex)]] <- renderPlot(generatePlot(targetHotel, hotelInfo[[rowIndex]]))
  # }
}

shinyApp(ui, server)