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
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla")
    #targetHotel <- "Hotel B bla  bla bla"
    
    #For 3 Hotels
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla")
    #targetHotel <- "Hotel B bla  bla bla"
    
    #For 4 Hotels
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla")
    #targetHotel <- "Hotel D bla  bla bla"
    
    #For 5 Hotels
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla")
    #targetHotel <- "Hotel D bla  bla bla"
    
    #For 6 Hotels
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla")
    #targetHotel <- "Hotel E bla  bla bla"
    
    #For 7 Hotels
    hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla")
    targetHotel <- "Hotel D bla  bla bla"
    
    #For 8 Hotels
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla")
    #targetHotel <- "Hotel D bla  bla bla"
    
    #For 9 Hotels
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla")
    #targetHotel <- "Hotel D bla  bla bla"
    
    #For 10 Hotels
    #hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla", "Hotel J bla  bla bla")
    #targetHotel <- "Hotel D bla  bla bla"
    
    rowIndexOfTargetHotel <- which(hotelName == targetHotel)
    
    # Create nodes tibble
    nodes <- tibble(id = 1:length(hotelName), label = hotelName)
    
    
    # Create edges tibble with desired ratings
    edges <- tibble(
      from = rep(rowIndexOfTargetHotel, length(hotelName) - 1),
      to = setdiff(1:length(hotelName), rowIndexOfTargetHotel),
      
      #For 2 Hotels
      #rating = c("r-2.5")
      
      #For 3 Hotels
      #rating =c("r-2.5", "r-4")
      
      #For 4 Hotels
      #rating =c("r-2.5", "r-4", "r-6")
      
      #For 5 Hotels
      #rating =c("r-2.5", "r-4", "r-6", "r-3")
      
      #For 6 Hotels
      #rating =c("r-2.5", "r-4", "r-6", "r-3", "r-8")
      
      #For 7 Hotels
      rating = c("r-2.5", "r-4", "r-6", "r-3", "r-8", "r-7")
      
      #For 8 Hotels
      #rating =c("r-2.5", "r-4", "r-6", "r-3", "r-8", "r-7", "r-9")
      
      #For 9 Hotels
      #rating =c("r-2.5", "r-4", "r-6", "r-3", "r-8", "r-7", "r-9", "r-5")
      
      #For 10 Hotels
      #rating =c("r-2.5", "r-4", "r-6", "r-3", "r-8", "r-7", "r-9", "r-5", "r-4")
    )
    
    # Create a tidygraph
    graph <- tbl_graph(nodes = nodes, edges = edges)
    
    # Add edge_size and layout
    E(graph)$edge_size <- as.numeric(gsub("r-", "", edges$rating)) #convert r-8 to numeric 8
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    
    # Prices data
    
    #For 2 Hotels
    #prices <- c("Tk 1200", "Tk 1250")
    
    #For 3 Hotels
    #prices <- c("Tk 1200", "Tk 1250", "Tk 1350")
    
    #For 4 Hotels
    #prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850")
    
    #For 5 Hotels
    #prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650")
    
    #For 6 Hotels
    #prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150")
    
    #For 7 Hotels
    prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800")
    
    #For 8 Hotels
    #prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500")
    
    #For 9 Hotels
    #prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500")
    
    #For 10 Hotels
    #prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500", "Tk 1350")
    
    # Additional text for "7.5"
    additional_text <- ifelse(nodes$label == targetHotel, "r-7.5", "")
    
    # Plotting using ggplot2
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating, vjust = -0.2, hjust = -0.7, color = "darkorange"), #for 2 to 8 hotels 
      #geom_edge_link(aes(label = rating, vjust = 1.5, hjust = 1.8, color = "darkorange"), #for hotel 9
      #geom_edge_link(aes(label = rating, vjust = 1, hjust = -0.6, color = "darkorange"), #for 10 hotel
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm")) +
      geom_node_point(aes(color = as.factor(id)), size = ifelse(nodes$id == rowIndexOfTargetHotel, 25, 23)) +
      geom_node_text(aes(label = str_wrap(nodes$label, width = 12)), vjust = 0.2, hjust = 0.5, size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.3, 3.1)) +
      geom_node_text(aes(label = prices), vjust = 2, hjust = 0.5, color = "black", size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.3, 3.1)) +
      geom_node_text(aes(label = additional_text), vjust = 3.1, hjust =0.5, size = 3.5, color = "red") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
  })
}

shinyApp(ui, server)
