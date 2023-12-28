library(shiny)

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

server <- function(input, output, session) {
  output$graphPlot <- renderPlot({
    # Define data
    hotelName <- c("Hotel A", "Hotel B", "Hotel C", "Hotel D", "Hotel E", "Hotel F")
    targetHotel <- "Hotel B"
    existingRating <- c("r-2.5", "r-4", "r-3", "r-4", "r-5", "r-6")
    targetRating <- "r-4"
    prices <- c("Tk 1200", "Tk 1250", "Tk 1300", "Tk 1200", "Tk 1250", "Tk 1300")
    
    # Identify the row index of the target hotel
    rowIndexOfTargetHotel <- which(hotelName == targetHotel)
    
    # Remove the target rating from existingRating for edges (non-target nodes)
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
    
    # Additional text for target rating
    targetrating <- ifelse(nodes$label == targetHotel, as.character(targetRating), "")
    
    # Plot using ggraph and ggplot2
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = rating, vjust = 1.5, hjust = 1.9, color = "darkorange"),
                     show.legend = FALSE,
                     start_cap = circle(5, "mm"),
                     end_cap = circle(5, "mm")) +
      geom_node_point(aes(x = layout[, 1], y = layout[, 2], color = as.factor(id)),
                      size = ifelse(nodes$id == rowIndexOfTargetHotel, 31, 25)) +
      geom_text(aes(x = layout[, 1], y = layout[, 2], label = str_wrap(nodes$label, width = 14)), 
                vjust = 0.2, hjust = 0.5, 
                size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.6, 2.9),
                check_overlap = TRUE) +
      geom_node_text(aes(label = prices), vjust = 2.7, hjust = 0.5, color = "black", size = ifelse(nodes$id == rowIndexOfTargetHotel, 3.6, 3.2)) +
      geom_node_text(aes(label = targetrating), vjust = 4.4, hjust = 0.5, size = 3.6, color = "red") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
  })
}

shinyApp(ui, server)