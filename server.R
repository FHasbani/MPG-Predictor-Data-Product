library(shiny)
library(ggplot2)
library(datasets)
data(mtcars)
model <- lm(mpg ~ wt + am + qsec, data = mtcars)

shinyServer(function(input, output) {
   
   # Displays the Output Script summarizing the Input Vaiables and the resulting calculation of the predictive formula
   output$predictor <- renderText({ 
      # Manual Transmission Scenario
      if (input$trans){paste("Your MPG estimate is: ", mpg <- 9.618 - 3.917 * input$wt/1000 + 1.226*input$qsec + 2.935*input$trans,  "becasue you have chosen a car that weights ", input$wt, "lbs, and reachs quarter of a mile in ", input$qsec, " seconds, using a Manual Transmission")}
      # Automatic Transmission Scenario
      else {paste("Your MPG estimate is: ", mpg <- 9.618 - 3.917 * input$wt/1000 + 1.226*input$qsec + 2.935*input$trans,  "You have chosen a car that weights ", input$wt, " lbs, and reachs quarter of a mile in ", input$qsec, " seconds, using an Automatic Transmission")}
            
   })
   
   # Displays the complete dataset in a large table.
   output$myData = renderDataTable({
      mtcars
   })
   
   # Displays the summary of the dataset.
   output$mySummary <- renderPrint({
      summary(model)
         })

   # Displays the structure of the  dataset, .
   output$view <- renderPrint({
         str(mtcars)
            })
   
   # Displays the Boxplot of the full dataset.
   output$myTime = renderPlot({
         boxplot(as.numeric(mpg) ~ cyl, data = mtcars, col = "lightgreen")
   })
   
   # Displays the ScatterPlot of the full dataset.
   output$dataSummary = renderPrint({
      summary(mtcars)
      })
   
   # Displays a correlation plot of the dataset. 
   output$myplot <- renderPlot({
      plot(mtcars, main="Cross Variable Correlation Analysis")
   })
   
})
