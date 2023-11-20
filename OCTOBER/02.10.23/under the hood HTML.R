library(shiny)
ui <- fluidPage(
  h1("This is a heading"),
  p("This is some text", class = "my-class"),
  tags$ul( #ul unorderd bullet list
    tags$li("First bullet"), 
    tags$li("Second bullet")
  )
)
server<-function(input, output, session){
  
}
shinyApp(ui, server)