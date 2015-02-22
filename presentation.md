Data Science Project - Shiny Application to compute Body Mass Index (BMI)
========================================================
date: February 2015

Introduction
========================================================

This easy to use Shiny Application aims to compute the Body Mass Index (BMI) which is a measure to assess the relative size based on the mass and height of an individual. A higher score is often linked to higher risk of having diseases and health conditions for overweight and obese individuals and is represented by the red zone in the Gauge chart.

- Enter 2 data inputs (height in metres and weight in kilogrammes)
- Application ensures no invalid data inputs
- Application computes BMI and visualize score in gauge chart

Data Computation and Visualization
========================================================


```r
bmi_score <- function(height, weight){
  round(weight / (height * height),2)
}
```
The BMI score is computed (in server.R) using the entered weight and height values (from ui.R) and represented with a gauge chart to reflect green as healthy zone (including those who are underweight), yellow as low risk zone (overweight range), red as high risk zone (obese range).


Data Computation and Visualization
========================================================


```r
    output$obmi <- renderPrint({bmi_score(input$height, input$weight)})

    output$ogaugechart <- renderGvis({
      df <- data.frame(Label="BMI",Value=bmi_score(input$height, input$weight))
      gvisGauge(df, options=list(min=0, max=80, greenFrom=0, greenTo=25, yellowFrom=25, yellowTo=35, redFrom=35, redTo=80, width=200, height=200))
    })    
```


Data Source and Dependency
========================================================
![alt text](https://cloud.githubusercontent.com/assets/8671096/6319682/ae439626-bb00-11e4-9b47-e5d564c0eb83.png)

The BMI computation formula and desired range are extracted from [Wikipedia](http://en.wikipedia.org/wiki/Body_mass_index). This application requires googleVis package for R to plot the gauge chart and the latest web browser to support the viewing shown here using the latest web browser version. It is available [here](http://daenaw.shinyapps.io/Version2-Feb2015/).
