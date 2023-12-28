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
    hotelName <- c("Hotel A bla  bla bla", "Hotel B bla  bla bla", "Hotel C bla  bla bla", "Hotel D bla  bla bla", "Hotel E bla  bla bla", "Hotel F bla  bla bla", "Hotel G bla  bla bla", "Hotel H bla  bla bla", "Hotel I bla  bla bla")
    targetHotel <- "Hotel D bla  bla bla"
    rowIndexOfTargetHotel <- which(hotelName == targetHotel)
    
    # Create nodes tibble
    nodes <- tibble(id = 1:length(hotelName), label = hotelName)
    
    # Create edges tibble (assuming you want to connect all hotels to the target hotel)
    edges <- tibble(
      from = rep(rowIndexOfTargetHotel, length(hotelName) - 1),
      to = setdiff(1:length(hotelName), rowIndexOfTargetHotel),
      rating = c(2.5, 4, 6, 3, 8, 7, 9, 5)
    )
    
    # Create a tidygraph
    graph <- tbl_graph(nodes = nodes, edges = edges)
    
    # Add edge_size and layout
    E(graph)$edge_size <- edges$rating
    layout <- layout_with_kk(graph, weights = E(graph)$edge_size)
    
    # Prices data
    prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500")
    
    # Specify the desired_ratings vector
    desired_ratings <- c("r-2.5", "r-4", "r-6", "r-3", "r-8", "r-7", "r-9", "r-5.5")
    
    # Additional text for "7.5"
    additional_text <- ifelse(nodes$label == targetHotel, "r-7.5", "")
    
    # Plotting using ggplot2
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = desired_ratings, vjust = 1.5, hjust = 1.8, color = "darkorange"), 
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm")) +
      geom_node_point(aes(color = as.factor(id)), size = ifelse(nodes$id == rowIndexOfTargetHotel, 25, 20)) +
      geom_node_text(aes(label = str_wrap(nodes$label, width = 12)), vjust = 0.2, hjust = 0.5, size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.2, 2.5)) +
      geom_node_text(aes(label = prices), vjust = 2, hjust = 0.5, color = "black", size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.2, 2.5)) +
      geom_node_text(aes(label = additional_text), vjust = 3.1, hjust =0.5, size = 3.5, color = "red") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
  })
}

shinyApp(ui, server)
