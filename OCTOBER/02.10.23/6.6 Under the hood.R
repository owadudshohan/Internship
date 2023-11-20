library(shiny)
ui <- fluidPage(
  HTML(r"(
       <div class="container-fluid">
  <div class="form-group shiny-input-container">
    <label for="name">What's your name?</label>
    <input id="name" type="text" class="form-control" value=""/>
  </div>
</div>
       
    <h1>This is a heading</h1>
    <p class="my-class">This is some text!</p>
    <ul>
      <li>First bullet</li>
      <li>Second bullet</li>
    </ul>
    
  )")
)
server<-function(input, output, session){
  
}
shinyApp(ui, server)