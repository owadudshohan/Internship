library(shiny)
library(igraph)
library(tidygraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)

# Sample data for 7 hotels
hotelInfo <- tibble(
  hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla"),
  Rating = c("2.5", "4", "6", "7.5", "2", "8", "7"),
  priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800"),
  priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800"),
  priceTripleRoom = c("Tk 4200", "Tk 6250", "Tk 7350", "Tk 3850", "Tk 6650", "Tk 3850", "Tk 4800")
)
targetHotel <- "Hotel D bla  bla bla"

roomTypes <- c("Single Room", "Double Room", "Triple Room")

ui <- fluidPage(
  shiny::tags$head(
    shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=0.5")
  ),
  fluidRow(
    lapply(roomTypes, function(roomType) {
      column(
        width = 12, align = "center",
        h3(paste(roomType, "Plot"), align = "center", style = "margin-bottom: 40px;"),
        plotOutput(paste0(tolower(roomType), "Plot"), height = "600px", width = "600px")
      )
    })
  )
)

server <- function(input, output) {
  generatePlot <- function(targetHotel, priceRoom, roomType) {
    rowIndexOfTargetHotel <- which(hotelInfo$hotelName == targetHotel)
    
    edgeRatings <- hotelInfo$Rating[-rowIndexOfTargetHotel]
    
    firstFourWords <- sapply(str_split(hotelInfo$hotelName, "\\s+"), function(words) paste(words[1:4], collapse = " "))
    
    nodes <- tibble(id = 1:length(hotelInfo$hotelName), label = firstFourWords)
    
    edges <- tibble(
      from = rep(rowIndexOfTargetHotel, length(hotelInfo$hotelName) - 1),
      to = setdiff(1:length(hotelInfo$hotelName), rowIndexOfTargetHotel),
      rating = edgeRatings
    )
    
    graph <- tbl_graph(nodes = nodes, edges = edges)
    E(graph)$edge_size <- (edges$rating)
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    
    vjust <- ifelse(length(hotelInfo$hotelName) <= 3, 1,
                    ifelse(length(hotelInfo$hotelName) == 4, -1.3,
                           ifelse(length(hotelInfo$hotelName) == 5, -0.4,
                                  ifelse(length(hotelInfo$hotelName) == 6, -1.3,
                                         ifelse(length(hotelInfo$hotelName) == 7, 1.5,
                                                ifelse(length(hotelInfo$hotelName) == 8, 1.2,
                                                       ifelse(length(hotelInfo$hotelName) == 9, 1.2, 1)))))))
    
    hjust <- ifelse(length(hotelInfo$hotelName) <= 3, -0.7,
                    ifelse(length(hotelInfo$hotelName) == 4, -0.5,
                           ifelse(length(hotelInfo$hotelName) == 5, -0.9,
                                  ifelse(length(hotelInfo$hotelName) == 6, 1.8,
                                         ifelse(length(hotelInfo$hotelName) == 7, 1.5,
                                                ifelse(length(hotelInfo$hotelName) == 8, 1.1,
                                                       ifelse(length(hotelInfo$hotelName) == 9, 1.2, 0.1)))))))
    
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
               label = hotelInfo$Rating[rowIndexOfTargetHotel], vjust = 4.6, hjust = 0.5, size = ifelse(length(hotelInfo$hotelName) == 2, 2.8, 3.4), color = "red") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
  }
  
  for (roomType in roomTypes) {
    output[[paste0(tolower(roomType), "Plot")]] <- renderPlot({
      generatePlot(targetHotel, hotelInfo[[paste0("price", gsub(" ", "", roomType))]], roomType)
    })
  }
}

shinyApp(ui, server)
