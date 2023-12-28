library(shiny)
library(igraph)
library(tidygraph)
library(ggraph)
library(tibble)
library(stringr)
library(ggplot2)

ui <- fluidPage(
  tags$head(
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=0.5")
  ),
  fluidRow(
    style = "display: flex; justify-content: center; align-items: center; height: 100vh;",
    column(width = 12, align = "center", 
           plotOutput("graphPlot", height = "600px", width = "600px")
    )
  )
)

server <- function(input, output) {
  output$graphPlot <- renderPlot({
    # Define the new data
    
    #For 2 Hotels
    # hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla")
    # targetHotel <- "Hotel B bla  bla bla"
    # existingRating <- c("r-2.5", "r-4")
    # targetRating <- "r-4"
    # prices <- c("Tk 1200", "Tk 1250")
    
    #For 3 Hotels
    # hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla")
    # targetHotel <- "Hotel A bla  bla bla"
    # existingRating <- c("r-2.5", "r-4", "r-6")
    # targetRating <- "r-2.5"
    # prices <- c("Tk 1200", "Tk 1250", "Tk 1350")
    
    #For 4 Hotels
    # hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla")
    # targetHotel <- "Hotel D bla  bla bla"
    # existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5")
    # targetRating <- "r-7.5"
    # prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850")
    
    #For 5 Hotels
    # hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla")
    # targetHotel <- "Hotel D bla  bla bla"
    # existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5", "r-3")
    # targetRating <- "r-7.5"
    # prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650")
    
    # #for 6 Hotels
    # hotelName <- c("Hotel city International Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla")
    # targetHotel <- "Hotel D bla  bla bla"
    # existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5", "r-3", "r-8")
    # targetRating <- "r-7.5"
    # prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150")
    
    # 
    # #for 7 Hotels
    # hotelName <- c("Hotel city International Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla")
    # targetHotel <- "Hotel D bla  bla bla"
    # existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5", "r-3", "r-8", "r-7")
    # targetRating <- "r-7.5"
    # prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800")
    
    #For 8 Hotels
    hotelName <- c("Hotel A", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla")
    existingRating <- c("r-2.5", "r-4", "r-6","r-7.5", "r-3", "r-8", "r-7", "r-9")
    priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500")
    priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800", "Tk 6500")
    hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    targetHotel <- "Hotel D bla  bla bla"  
    
    # #For 9 Hotels
    # hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla")
    # targetHotel <- "Hotel D bla  bla bla"
    # existingRating <- c("r-2.5", "r-4", "r-6","r-7.5", "r-3", "r-8", "r-7", "r-9", "r-5")
    # targetRating <- "r-7.5"
    # prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500")
    
    #For 10 Hotels
    # hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla", "Hotel J bla  bla bla")
    # targetHotel <- "Hotel D bla  bla bla"
    # existingRating <- c("r-2.5", "r-4", "r-6","r-7.5", "r-3", "r-8", "r-7", "r-9", "r-5", "r-4")
    # targetRating <- "r-7.5"
    # prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500", "Tk 1350")
    # 
    
    
    rowIndexOfTargetHotel <- which(hotelName == targetHotel)
    
    # Remove "r-7.5" from existingRating vector for edges (non-target nodes)
    edgeRatings <- existingRating[-rowIndexOfTargetHotel]
    
    # Create nodes tibble
    nodes <- tibble(id = 1:length(hotelName), label = hotelName)
    
    # Create edges tibble
    edges <- tibble(
      from = rep(rowIndexOfTargetHotel, length(hotelName) - 1),
      to = setdiff(1:length(hotelName), rowIndexOfTargetHotel),
      rating = edgeRatings
    )
    
    # Create a tidygraph
    graph <- tbl_graph(nodes = nodes, edges = edges)
    
    # Add edge_size and layout
    E(graph)$edge_size <- as.numeric(gsub("r-", "", edges$rating))
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    
    targetrating <- ifelse(nodes$label == targetHotel, as.character(existingRating[rowIndexOfTargetHotel]), "")
    
    # Plotting using ggplot2 with geom_text
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating, vjust = 1.5, hjust = 1.5, color = "darkorange"), #for hotel 7
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm")) +
      geom_node_point(aes(x = layout[, 1], y = layout[, 2], color = as.factor(id)), 
                      size = ifelse(nodes$id == rowIndexOfTargetHotel, 31, 25)) +
      geom_text(aes(x = layout[, 1], y = layout[, 2], label = str_wrap(nodes$label, width = 14)), 
                vjust = ifelse(nodes$id == rowIndexOfTargetHotel, 0.2, 0.2),
                hjust = 0.5, 
                size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.6, 2.8),
                check_overlap = TRUE) +
      geom_node_text(aes(label = priceSingleRoom), vjust = 2.7, hjust = 0.5, color = "black", size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.6, 3.2)) +
      geom_node_text(aes(label = targetrating), vjust = 4.4, hjust = 0.5, size = 3.6, color = "red") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
  })
}

shinyApp(ui, server)
