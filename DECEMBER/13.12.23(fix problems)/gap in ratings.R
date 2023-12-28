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
  
  # CSv file connect
  data <- read.csv("E:/WORK/HOTEL DATA/4-starhotelinRiga.csv")
  data1 <- read.csv("E:/WORK//HOTEL DATA/4-starhotelinVienna.csv")
  data2 <- read.csv("E:/WORK/HOTEL DATA/4-starhotelinAmsterdam.csv")
  
  # For Amsterdam
  hotelInfo <- tibble(
    hotelName = data2 %>% filter(RoomType == "Single") %>% pull(HotelName) %>% head(10),
    Rating = paste0("r- ", data2 %>% filter(RoomType == "Single") %>% pull(Ratings) %>% head(10)),
    priceSingleRoom = paste0("৳ ", parse_number(data2 %>% filter(RoomType == "Single") %>% pull(Price) %>% head(10))),
    priceDoubleRoom = paste0("৳ ", parse_number(data2 %>% filter(RoomType == "Double") %>% pull(Price) %>% head(10))),
    priceTripleRoom = paste0("৳ ", parse_number(data2 %>% filter(RoomType == "Triple") %>% pull(Price) %>% head(10))),
  )
  targetHotel <- "DoubleTree by Hilton Amsterdam Centraal Station"
  
  generatePlot <- function(targetHotel, priceRoom) {
    rowIndexOfTargetHotel <- which(hotelInfo$hotelName == targetHotel)
    
    edgeRatings <- hotelInfo$Rating[-rowIndexOfTargetHotel]
    
    firstFourWords <- sapply(str_split(hotelInfo$hotelName, "\\s+"), function(words) paste(words[1:3], collapse = " "))
    
    nodes <- tibble(id = 1:length(hotelInfo$hotelName), label = firstFourWords)
    
    edges <- tibble(
      from = rep(rowIndexOfTargetHotel, length(hotelInfo$hotelName) - 1),
      to = setdiff(1:length(hotelInfo$hotelName), rowIndexOfTargetHotel),
      rating = edgeRatings
    )
    
    # Create a new dataframe for split edges
    splitEdges <- tibble(
      from = setdiff(1:length(hotelInfo$hotelName), rowIndexOfTargetHotel),
      to = rep(rowIndexOfTargetHotel, length(hotelInfo$hotelName) - 1),
      rating = edgeRatings
    )
    
    edges <- bind_rows(edges, splitEdges)
    
    graph <- tbl_graph(nodes = nodes, edges = edges)
    
    E(graph)$edge_size <- (str_remove(edgeRatings , "^r-"))
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    
    hjustnode <- 0.5
    
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating), 
                     label_colour = "gold", vjust = -1, hjust = 0.5,
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm"),
                     color = "gold",
                     lineend = "round",
                     arrow = arrow(type = "closed", length = unit(0.15, "inches"))) +
      geom_node_point(aes(x = layout[, 1], y = layout[, 2], color = as.factor(id)), 
                      size = ifelse(nodes$id == rowIndexOfTargetHotel, 33, 25.5)) +
      geom_text(aes(x = layout[, 1], y = layout[, 2], label = str_wrap(nodes$label, width = 13)), 
                color = "black",
                fontface = ifelse(nodes$id == rowIndexOfTargetHotel, "bold", "plain"),
                vjust = 0.2, hjust = hjustnode, 
                size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.2, 2.8),
                check_overlap = TRUE) +
      geom_node_text(aes(label = priceRoom), vjust = 2.7, hjust = hjustnode, color = "black", 
                     fontface = ifelse(nodes$id == rowIndexOfTargetHotel, "bold", "plain"), 
                     size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.2, 2.8)) +
      annotate("text", x = layout[rowIndexOfTargetHotel, 1], y = layout[rowIndexOfTargetHotel, 2],
               label = hotelInfo$Rating[rowIndexOfTargetHotel], vjust = 4.6, hjust = hjustnode, 
               size = 3.5, color = "darkblue", fontface = "bold") +
      theme_void() +
      theme(
        panel.background = element_rect(fill = "black"),
        plot.background = element_rect(fill = "black"),
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
          h3(names(hotelInfo)[rowIndex], align = "center", style = "margin-bottom: 40px; margin-top: 50px"),
          plotOutput(paste0("plot-",rowIndex), width = "95vw", height = "90vh")
        )
      )
    })
  })
  
  lapply(3:length(hotelInfo), function(rowIndex){   
    output[[paste0("plot-",rowIndex)]] <- renderPlot(generatePlot(targetHotel, hotelInfo[[rowIndex]]))
  })
  
  
}

shinyApp(ui, server)
