library(shiny)
library(igraph)
library(tidygraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)
library(tidyverse)

ui <- fluidPage(
  shiny::tags$head(
    shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=0.5")
  ),
  uiOutput("plot"),
)

server <- function(input, output) {
  
  #CSv file connect
  data <- read.csv("E:/WORK/HOTEL DATA/4-starhotelinRiga.csv")
  data1 <- read.csv("E:/WORK//HOTEL DATA/4-starhotelinVienna.csv")
  data2 <- read.csv("E:/WORK/HOTEL DATA/4-starhotelinAmsterdam.csv")
  
  head=10
  
  #for Amsterdam
  hotelInfo <- tibble(
    hotelName = data2 %>% filter(RoomType == "Single") %>% pull(HotelName) %>% head(10),
    Rating = paste0("r- ",data2 %>% filter(RoomType == "Single") %>% pull(Ratings) %>% head(10)),
    
    
    priceSingleRoom = paste0("৳ ",parse_number(data2 %>% filter(RoomType == "Single") %>% pull(Price) %>% head(10))),
    priceDoubleRoom = paste0("৳ ",parse_number(data2 %>% filter(RoomType == "Double") %>% pull(Price) %>% head(10))),
    priceTripleRoom = paste0("৳ ",parse_number(data2 %>% filter(RoomType == "Triple") %>% pull(Price) %>% head(10))),
  )
  print(hotelInfo)
  targetHotel <- hotelInfo$hotelName[[5]] #"DoubleTree by Hilton Amsterdam Centraal Station"
  
  
  generatePlot <- function(targetHotel, priceRoom) {
    rowIndexOfTargetHotel <- which(hotelInfo$hotelName == targetHotel)
    edgeRatings <- hotelInfo$Rating[-rowIndexOfTargetHotel]
    
    firstFourWords <- sapply(str_split(hotelInfo$hotelName, "\\s+"), function(words) paste(words[1:3], collapse = " "))
    
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
    E(graph)$edge_size <- (str_remove(edges$rating, "^r-"))
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    #E(graph) is used to access the edge data of the graph.
    #$edge_size is used to extract the values in the edge_size column of the edge data.
    #It stands for the Kamada-Kawai layout algorithm. This algorithm is used for arranging the nodes of a graph in a 
    #visually pleasing way, taking into account the distances between nodes.
    
    
    TargetnodeSizefor2=25
    Neibornodesizefor2=23
    TargetnodeSizeforALL=33
    NeibornodesizeforALL=25.5
    
    hjustnode=0.5
    
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating), label_colour = "black",
                     angle_calc = "along",
                     alpha = 1/5,
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm"),
                     color = "black" ) #+
    # geom_node_point(aes(x = layout[, 1], y = layout[, 2], color = as.factor(id)), 
    #                 size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, TargetnodeSizefor2,  TargetnodeSizeforALL), ifelse(length(hotelInfo$hotelName) == 2,  Neibornodesizefor2,  NeibornodesizeforALL ))) +
    # geom_text(aes(x = layout[, 1], y = layout[, 2], label = str_wrap(nodes$label, width = 13)), 
    #           color="black",
    #           fontface=ifelse(nodes$id == rowIndexOfTargetHotel,"bold", "plain"),
    #           vjust = 0.2, hjust = hjustnode, 
    #           size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, 3, 3.3), ifelse(length(hotelInfo$hotelName) == 2, 2.5, 2.8)),
    #           check_overlap = TRUE) +
    # geom_node_text(aes(label = priceRoom), vjust = 2.7, hjust = hjustnode, color = "black",fontface=ifelse(nodes$id == rowIndexOfTargetHotel,"bold", "plain"), size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelInfo$hotelName) == 2, 3, 3.3), ifelse(length(hotelInfo$hotelName) == 2, 2.5, 3.2))) +
    # annotate("text", x = layout[rowIndexOfTargetHotel, 1], y = layout[rowIndexOfTargetHotel, 2],
    #          label = hotelInfo$Rating[rowIndexOfTargetHotel],vjust = 4.6, hjust = hjustnode, size = ifelse(length(hotelInfo$hotelName) == 2, 2.8, 3.5), color = "darkblue", fontface="bold") +
    # theme_void() +
    # theme(
    #   panel.background = element_rect(fill = "black"),  # Set the panel background color
    #   plot.background = element_rect(fill = "black"),   # Set the plot background color
    #   plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
    #   legend.position = "none"
    # )
  }
  
  output$plot <- renderUI({
    lapply(3:length(hotelInfo), function(rowIndex){  
      fluidRow(
        style = "display: flex; justify-content: center; align-items: center;",
        column(
          width = 12, align = "center",
          h3(names(hotelInfo)[rowIndex], align = "center", style = "margin-bottom: 40px; margin-top: 50px"), # Added plot title
          
          plotOutput(paste0("plot-",rowIndex), width = "95vw", height = "90vh") #added line
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