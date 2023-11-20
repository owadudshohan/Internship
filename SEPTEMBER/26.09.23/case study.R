library(shiny)
sales <- readr::read_csv("E:\\WORK\\26.09.23\\sales_data_sample.csv")
sales <- sales[c(
  "TERRITORY", "ORDERDATE", "ORDERNUMBER", "PRODUCTCODE",
  "QUANTITYORDERED", "PRICEEACH"
)]
sales
ui <- fluidPage(
  selectInput("territory", "territory", choices = unique(sales$TERRITORY)),
  tableOutput("selected")
)
server <- function(input, output, session) {
  selected <- reactive(sales[sales$TERRITORY == input$territory, ])
  output$selected <- renderTable(head(selected(), 10))
}
shinyApp(ui, server)