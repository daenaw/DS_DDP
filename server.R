library(googleVis)
library(shiny)

bmi_score <- function(height, weight){
  round(weight / (height * height),2)
}

weight <- 0
height <- 0
shinyServer(
  function(input, output) {

    output$oweight <- renderPrint({input$weight})
    output$oheight <- renderPrint({input$height})
    
    output$obmi <- renderPrint({bmi_score(input$height, input$weight)})

    output$ogaugechart <- renderGvis({
      df <- data.frame(Label="BMI",Value=bmi_score(input$height, input$weight))
      gvisGauge(df, options=list(min=0, max=80, greenFrom=0, greenTo=25, yellowFrom=25, yellowTo=35, redFrom=35, redTo=80, width=200, height=200))
    })    
    
  }
)
