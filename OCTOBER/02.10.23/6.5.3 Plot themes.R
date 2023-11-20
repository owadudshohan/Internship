library(shiny)
library(ggplot2)

ui <- fluidPage(
  theme = bslib::bs_theme(
    bg = "black", 
    fg = "white", 
    base_font = "time new roman"
  ),
  titlePanel("A themed plot"),
  plotOutput("plot"),
)

server <- function(input, output, session) {
  thematic::thematic_shiny() #thematic's auto theming gives R plots the ability to style themselves inside Shiny (via CSS)
  
  output$plot <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) +
      geom_point() +
      geom_smooth()
  }, res = 96)
}
shinyApp(ui, server)