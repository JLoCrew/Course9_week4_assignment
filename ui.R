library(shiny)




shinyUI(fluidPage(
  
  
  titlePanel("Predicting Temperature (F) in New York from May-Sep"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      
      sliderInput("OzoneInput", "Ozone", 0,200, value= 100),
      sliderInput("SolarInput", "Solar Radition", 0, 400, value = 200),
      sliderInput("WindInput", "Wind mph", 0, 20, value = 10),
      selectizeInput("newMonthInput", "Month", 
                     choices=list("May", "June", "July", "August", "September"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Temperature (F) in New York"),
      h2(textOutput("fit1"))
    )
  )
))