shinyUI(
  pageWithSidebar(
      headerPanel("Your Healthy Body Mass Index (BMI) Calculator"),
  
      sidebarPanel(
        numericInput('weight', 'Weight (kg)', 0, min = 0, max = 200, step = 0.1),
        numericInput('height', 'Height (m)', 0, min = 0, max = 3, step = 0.01),
        submitButton('Compute my BMI')
      ),
      
      mainPanel(
        h4('You have entered your weight(kg) as '),
        textOutput("oweight"),
        h4("and height(m) as "),
        textOutput("oheight"),
        h4('therefore your BMI score and gauge chart are '),
        textOutput("obmi"),
        htmlOutput("ogaugechart")
      )
  )
)
