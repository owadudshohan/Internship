library(shiny)
library(ggplot2)

ui <- fluidPage(
  plotOutput("myPlot")  # Define a placeholder for the plot
)

server <- function(input, output, session) {
  output$myPlot <- renderPlot({
    # Create the ggplot within the renderPlot function
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy)) + 
      facet_wrap(~ class, nrow = 2)
  })
}

shinyApp(ui, server)
