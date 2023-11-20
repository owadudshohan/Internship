library(shiny)
library(googlesheets4)
library(ggplot2)
#options(gargle_oauth_cache = ".secrets")

#gs4_auth()

# If successful, the previous step stores a token file.
# Check that a file has been created with:
#list.files(".secrets/")

# Check that the non-interactive authentication works by first deauthorizing:
#gs4_deauth()

# Authenticate using token. If no browser opens, the authentication works.
#gs4_auth(cache = ".secrets", email = "saleforecast.online@gmail.com")

ui <- fluidPage(
  plotOutput("plot")
)
server=function(input, output, session){
  gs4_auth(cache = ".secrets", email = "saleforecast.online@gmail.com")
  dataset <- read_sheet("https://docs.google.com/spreadsheets/d/1FL6JxJ1L-NBxt_1IfBk6KKQca_bB066I-UlzS2EPmP8/edit#gid=960400146")
  output$plot <- renderPlot({
    ggplot(data = dataset) + 
      geom_point(mapping = aes(x = data[[1]], y = data[[2]],color=data[[2]]))
  })
}

shinyApp(ui, server)