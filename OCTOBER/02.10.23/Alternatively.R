library(shiny)
ui <- fluidPage(
  theme = bslib::bs_theme(
    bg = "darkorange", 
    fg = "black", 
    base_font = "time new roman"
  ),
  sidebarLayout(
    position = "right",
    sidebarPanel(
      textInput("txt", "Text input:", "text here"),
      sliderInput("slider", "Slider input:", 1, 100, 30,)
    ),
    mainPanel(
      h1(paste0("Theme: Any theme you like")),
      h2("Header 2"),
      p("Some text")
    )
  )
)
server<-function(input, output, session){
  
}
shinyApp(ui, server)


