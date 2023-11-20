# app.R

library(shiny)
library(tidygraph)
library(igraph)
library(ggraph)
library(tibble)
library(stringr)

# Create nodes
nodes <- tibble(id = 1:10, label = c("Hotel A bla bla bla", "Hotel B bla bla bla", "Hotel C bla bla bla", "Hotel D bla bla bla", "Hotel E bla bla bla", "Hotel F bla bla bla", "Hotel G bla bla bla", "Hotel H bla bla bla", "Hotel I bla bla bla", "Hotel J bla bla bla"))

# Specify edges
edges <- tibble(
  from = c(4, 4, 4, 4, 4, 4, 4, 4, 4),
  to = c(1, 2, 3, 5, 6, 7, 8, 9, 10),
  rating = c(2, 3, 4, 6, 8, 7, 9, 5, 3)
)

# Create a tidygraph
graph <- tbl_graph(nodes = nodes, edges = edges)
prices <- c("Tk 1200", "Tk 1250", "Tk 1350", "Tk 1850", "Tk 1650", "Tk 2150", "Tk 1800", "Tk 2500", "Tk 1500", "Tk 1300")

# Add edge_size and layout
E(graph)$edge_size <- edges$rating
layout <- layout_with_kk(graph, weights = E(graph)$edge_size)

# Define the desired rating values
desired_ratings <- c("r-2.5", "r-3", "r-4", "r-6", "r-8", "r-7", "r-9", "r-5.5", "r-3")

# Define UI
ui <- fluidPage(
  titlePanel("Hotel Ratings Visualization"),
  mainPanel(
    plotOutput("graphPlot")
  )
)

# Define server logic
server <- function(input, output) {
  output$graphPlot <- renderPlot({
    ggraph(graph, layout = layout) +
      geom_edge_link(aes(label = desired_ratings, vjust = 0.6, hjust = -0.8, color = "darkorange"),
                     show.legend = FALSE,
                     start_cap = circle(3, "mm"),
                     end_cap = circle(3, "mm")) +
      geom_node_point(aes(color = as.factor(id)), size = 18) +
      geom_node_text(aes(label = str_wrap(label, width = 8)), vjust = 0.2, hjust = 0.5, size = 2) +
      geom_node_text(aes(label = prices), vjust = 3, hjust = 0.5, size = 2, color = "black") +
      theme_void() +
      theme(
        plot.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.position = "none"
      )
  })
}

# Run the app
shinyApp(ui = ui, server = server)
