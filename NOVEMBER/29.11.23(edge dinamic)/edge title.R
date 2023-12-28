library(shiny)
library(igraph)
library(tidygraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)

# hotelInfo data for 7 hotels
hotelInfo <- tibble(
  hotelName = c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla"),
  Rating = c("2.5", "4", "6", "7.5", "2", "8", "7"),
  priceSingleRoom = c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800"),
  priceDoubleRoom = c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800"),
  priceTripleRoom = c("Tk 4200", "Tk 6250", "Tk 8350", "Tk 8850", "Tk 9650", "Tk 7850", "Tk 9800"),
  priceFamilyRoom = c("Tk 6200", "Tk 10250", "Tk 15350", "Tk 16850", "Tk 18650", "Tk 13850", "Tk 18800")
)
targetHotel <- "Hotel D bla  bla bla"

ui <- fluidPage(
  tags$head(
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=0.5")
  ),
  uiOutput("plot"),
)

server <- function(input, output) {
  generatePlot <- function(targetHotel, priceRoom, plotTitle) {
    rowIndexOfTargetHotel <- which(hotelInfo$hotelName == targetHotel)
    
    edgeRatings <- hotelInfo$Rating[-rowIndexOfTargetHotel]
    
    firstFourWords <- sapply(str_split(hotelInfo$hotelName, "\\s+"), function(words) paste(words[1:4], collapse = " "))
    
    nodes <- tibble(id = 1:length(hotelInfo$hotelName), label = firstFourWords)
    
    edges <- tibble(
      from = rep(rowIndexOfTargetHotel, length(hotelInfo$hotelName) - 1),
      to = setdiff(1:length(hotelInfo$hotelName), rowIndexOfTargetHotel),
      rating = edgeRatings
    )
    
    # Add the following line to convert 'rating' to numeric
    edges$rating <- as.numeric(edges$rating)
    
    graph <- tbl_graph(nodes = nodes, edges = edges)
    E(graph)$edge_size <- (edges$rating)
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    
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
    
    TargenodeSizefor2=25
    Neibornodesizefor2=23
    TargetnodeSizeforALL=31
    NeibornodesizeforALL=25
    
    hjustnode=0.5
    
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = round(rating, 2), vjust = vjust, hjust = hjust, color = "darkorange"), 
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
        style = "display: flex; justify-content: center; align-items: center; height: 100vh;",
        column(
          width = 12, align = "center",
          h3(names(hotelInfo)[rowIndex], align = "center", style = "margin-bottom: 40px;"),  # Use column names as plot titles
          renderPlot(generatePlot(targetHotel, hotelInfo[[rowIndex]], names(hotelInfo)[rowIndex]), height = 600, width = 600)
        )
      )
    })
  })
}

shinyApp(ui, server)
