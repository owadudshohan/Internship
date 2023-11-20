
library(shiny)
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "sandstone"),
  sidebarLayout(
    sidebarPanel(
      textInput("txt", "Text input:", "text here"),
      sliderInput("slider", "Slider input:", 1, 100, 30)
    ),
    mainPanel(
      h1(paste0("Theme: united")),
      h2("Header 2"),
      p("Some text")
    )
  )
)
server<-function(input, output, session){
  
}
shinyApp(ui, server)
