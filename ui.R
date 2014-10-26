library(shiny)
library(ggplot2)  

shinyUI(pageWithSidebar(
   headerPanel('The Car Mileage Predictor'),
   sidebarPanel(
      helpText('The Car Mileage Predictor is a calculator of Miles Per Gallon of a hypothetical car based on the Weight(wt), Quarter Of A Mile in Seconds(qsec) and if the Transmission is Automatic or Manual'),
      br(),
      helpText('First enter the weight of your car in lbs'),
      numericInput("wt", "Weight of the car in lbs:", 2000),
      br(),
      helpText("Second enter the quater of a mile in seconds"),
      numericInput("qsec", "Seconds to reachquarter of a mile:", 21),
      br(),
      helpText('Last select if the transmission is MT for manual or AT automatic'),
      checkboxInput("trans", "Check if Manual Transmission", FALSE),
      
      br(),
      p("For an introduction to the Car Mileage Predictor, visit the ",
        a("Pitch Presentation", 
          href = "https://github.com/FHasbani/DataProductPitch")),
      br()
   ),
   mainPanel(
      tabsetPanel(
         
         tabPanel('Predictor',
                  h6("Car Mileage Predictor"),
                  verbatimTextOutput("predictor")),
         tabPanel('How To Use It',
                  #plotOutput("histPlot")
                  helpText('The Car Mileage Predictor is a calculator of Miles Per Gallon of a hypothetical car based on the Weight(wt), Quarter Of A Mile in Seconds(qsec) and if the Transmission is Automatic or Manual'),
                  br(),
                  helpText('The rest of the Tabs are described below:'),
                  br(),
                  helpText("How to Use It Tab: Explains how to effectively use and understand this tool"),
                  br(),
                  helpText('Raw Data Tab: Shows the source data used to build the prediction model, use the search to filter, use the column heading to sort, and the dropdown to select the number of rows per page'),
                  br(),
                  helpText("Structure Tab: Shows the structure of the same data, as well as the statistical analysis of the model to help provide confidence in its effectiveness"),
                  br(),
                  helpText("Summary Tab: Shows the summary of both the Model and the Data, and explains the effectivness of the model."),
                  br(),
                  helpText("Box Plot Tab: Shows a Box Plot of the Variances of the MPG based of the number os cylinders, appears to be a predictor but ruled out due to low confidence"),
                  br(),
                  helpText("Correlation Plot Tab: SHows the Correlation between all the Column Variables. Diagonal Axis top right to bottom left lists the colum variable names. To find the the correlation between mpg and wt, look for coordinates (1,6)  in either direction, you will find a downward sloping scatterplot. 1 being the mpg or mile per gallon, first column in the data. 6 being the wt or weight, the sixth column of the data")
                  
                  
                  ),
         tabPanel('Raw Data',
                  dataTableOutput("myData")),
         tabPanel('Summary',
                  h6("Model Summary"),
                   verbatimTextOutput("mySummary"),
                  h6("Data Summary"),
                  verbatimTextOutput("dataSummary")),
         tabPanel('Structure',
                  h6("Observations"),
                  verbatimTextOutput("view")),
         tabPanel('Box Plot',
                  plotOutput("myTime")),
         tabPanel('Correlation Plot',
                  plotOutput("myplot"))
         
         
      )
   )
))
