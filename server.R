library(shiny)

airquality$newMonth <- ifelse(airquality$Month == 5, "May",
                                   ifelse(airquality$Month == 6, "June",
                                          ifelse(airquality$Month == 7, "July",
                                                 ifelse(airquality$Month == 8, "August", "September"))))


shinyServer(function(input, output) {
 
  
  fit1 <- lm(Temp ~ Ozone + Solar.R + Wind + factor(newMonth), data= airquality[, -c(5:6)])
  
  fit1pred <- reactive({
    OzoneInput <- input$OzoneInput
    SolarInput <- input$SolarInput
    WindInput <- input$WindInput
    newMonthInput <- input$newMonthInput
   
    
    predict(fit1, newdata= 
              data.frame(Ozone = OzoneInput,
                         Solar.R = SolarInput,
                         Wind = WindInput,
                         newMonth= newMonthInput
              ))
  })
  
  
  output$plot1 <- renderPlot({
    OzoneInput <- input$OzoneInput
    SolarInput <- input$SolarInput
    WindInput <- input$WindInput
    newMonthInput <- input$newMonthInput
    
     plot(airquality$Ozone, airquality$Temp, xlab = "Ozone", ylab = "Temp (F) in New York", bty="n", pch=16)
     
    
      abline(fit1, col="red", lwd=2)
    
  })
  
  output$fit1 <- renderText({
    fit1pred()
  })
  
})
