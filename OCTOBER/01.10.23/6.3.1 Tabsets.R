library(shiny)
ui <- fluidPage(
  tabsetPanel(
    tabPanel("Import data", 
             fileInput("file", "Data", buttonLabel = "Upload..."),
             textInput("delim", "Delimiter (leave blank to guess)", ""),
             numericInput("skip", "Rows to skip", 0, min = 0),
             numericInput("rows", "Rows to preview", 10, min = 1)
    ),
    tabPanel("Set parameters",
             
             textInput("name", "username:", value = "shohan"),
             passwordInput("password", "Enter your password here:", ""),
             actionButton("goButton", "Go!"),
             ),
    tabPanel("Visualise results")
  )
)
server<-function(input, output, session){
  
}
shinyApp(ui, server)