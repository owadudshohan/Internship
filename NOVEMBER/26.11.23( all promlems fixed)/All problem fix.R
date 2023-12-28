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
    # hotelName <- c("Hotel city The Residential", "Hotel B bla  bla bla")
    # existingRating <- c("r-2.5", "r-4")
    # priceSingleRoom <- c("Tk 1200", "Tk 1250")
    # priceDoubleRoom <- c("Tk 3200", "Tk 5250")
    # hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    # targetHotel <- "Hotel B bla  bla bla"
    
    #For 3 Hotels
    # hotelName <- c("Hotel city The Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla")
    # existingRating <- c("r-2.5", "r-4", "r-6")
    #priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350")
    #priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350")
    #hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    #targetHotel <- "Hotel C bla  bla bla"
    
    
    #For 4 Hotels
    # hotelName <- c("Hotel city International Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla")
    # existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5")
    # priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850")
    # priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850")
    # hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    # targetHotel <- "Hotel D bla  bla bla"
    
    
    #For 5 Hotels
    # hotelName <- c("Hotel city International Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla")
    # existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5", "r-3")
    #priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650")
    #priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650")
    #hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    #targetHotel <- "Hotel D bla  bla bla"
    
    
    # #for 6 Hotels
    # hotelName <- c("Hotel city International Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla")
    # existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5", "r-3", "r-8")
    #priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150")
    #priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850")
    #hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    #targetHotel <- "Hotel D bla  bla bla"
    
    
    # #for 7 Hotels
    hotelName <- c("Hotel city International Residential", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla")
    existingRating <- c("r-2.5", "r-4", "r-6", "r-7.5", "r-2", "r-8", "r-7")
    priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800")
    priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800")
    hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    targetHotel <- "Hotel D bla  bla bla"
    
    #For 8 Hotels
    # hotelName <- c("Hotel A This is the best hotel", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla")
    # existingRating <- c("r-2.5", "r-4", "r-6","r-7.5", "r-3", "r-8", "r-7", "r-9")
    # priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500")
    # priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800", "Tk 6500")
    # hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    # targetHotel <- "Hotel D bla  bla bla"
    
    # #For 9 Hotels
    # hotelName <- c("Hotel A This is the best hotel", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla")
    # existingRating <- c("r-2.5", "r-4", "r-6","r-7.5", "r-3", "r-8", "r-7", "r-9", "r-5")
    # priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500")
    # priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800", "Tk 6500" ,"Tk 3500")
    # hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    # targetHotel <- "Hotel D bla  bla bla"
    
    #For 10 Hotels
    # hotelName <- c("Hotel city The Residential Valo", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla", "Hotel J bla  bla bla")
    # existingRating <- c("r-2.5", "r-4", "r-6","r-7.5", "r-3", "r-8", "r-7", "r-9", "r-5", "r-4")
    # priceSingleRoom <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500", "Tk 1350")
    # priceDoubleRoom <- c("Tk 3200", "Tk 5250", "Tk 6350", "Tk 2850", "Tk 5650", "Tk 2850", "Tk 3800", "Tk 6500" ,"Tk 3500", "Tk 2600")
    # hotelInfo <- tibble(hotelName, existingRating, priceSingleRoom, priceDoubleRoom)
    # targetHotel <- "Hotel D bla  bla bla"
    
    
    rowIndexOfTargetHotel <- which(hotelName == targetHotel)
    
    # Remove "r-7.5" from existingRating vector for edges (non-target nodes)
    edgeRatings <- existingRating[-rowIndexOfTargetHotel]
    
    # Extract the first four words from each hotel name
    firstFourWords <- sapply(str_split(hotelName, "\\s+"), function(words) paste(words[1:4], collapse = " "))
    
    # Create nodes tibble with the first four words as labels
    nodes <- tibble(id = 1:length(hotelName), label = firstFourWords)
    
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
    
    
    # Additional text for "7.5"
    targetrating <- ifelse(nodes$label == targetHotel, as.character(targetRating), "")
    
    if(length(hotelName) <= 3){
      vjust = 1
      hjust = -0.7
    }else if(length(hotelName) == 4){
      vjust = -1.3
      hjust = -0.5
    }else if(length(hotelName) == 5){
      vjust = -0.4
      hjust = -0.7
    }else if(length(hotelName) == 6){
      vjust = -1.3
      hjust = -0.1
    }else if(length(hotelName) == 7){
      vjust = 1.5
      hjust = 1.5
    }else if(length(hotelName) == 8){
      vjust = 1.2
      hjust = 1.1
    }else if(length(hotelName) == 9){
      vjust = 1.2
      hjust = 1.2
    }else if(length(hotelName) == 10){
      vjust = 1
      hjust = 0.1
    }
    
    # Plotting using ggplot2 with geom_text
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating, vjust = vjust, hjust = hjust, color = "darkorange"), 
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm")) +
      geom_node_point(aes(x = layout[, 1], y = layout[, 2], color = as.factor(id)), 
                      
                      size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelName) == 2, 25, 31), ifelse(length(hotelName) == 2, 23, 25))) +
      geom_text(aes(x = layout[, 1], y = layout[, 2], label = str_wrap(nodes$label, width = 14)), 
                vjust = 0.2, hjust = 0.5, 
                
                size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelName) == 2, 3, 3.6), ifelse(length(hotelName) == 2, 2.5, 2.9)),
                check_overlap = TRUE) +
      geom_node_text(aes(label = priceSingleRoom), vjust = 2.7, hjust = 0.5, color = "black", size = ifelse(nodes$id == rowIndexOfTargetHotel, ifelse(length(hotelName) == 2, 3, 3.6), ifelse(length(hotelName) == 2, 2.5, 3.2))) +
      annotate("text", x = layout[rowIndexOfTargetHotel, 1], y = layout[rowIndexOfTargetHotel, 2],
               label = existingRating[rowIndexOfTargetHotel],vjust = 4.4, hjust = 0.5, size = ifelse(length(hotelName) == 2, 3, 3.6), color = "red") +  # add label for central node's rating
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
  })
}

shinyApp(ui, server)