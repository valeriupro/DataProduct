#' This application uses the mtcars dataset to run a multivariate model of the miles per gallon.
#' The research done as part of the Coursera Regression Models course shows that MPG is best predited 
#' by car's weight, acceleration performance and type of transmission.
#' 
library(shiny)
# The application requires a simple fluid page
shinyUI(fluidPage(
        # composed of a title panel and a main panel
        titlePanel("Predicting MPG by key technical features of the car"),
        sidebarLayout(
                sidebarPanel(
                        
                        # This section defines inputs required, as a radio button for type of transmission of the car and two 
                        # sliders for car's weight and 1/4 mile time
                        radioButtons('radioam', 'Please select your prefered type of transmission:', 
                                     c("Manual"=1,"Automatic"=0), selected=NULL, inline=TRUE),
                        sliderInput('sliderwt', 'Please select weight, 1000 lb', min=0, max=6, value=3, step=0.1),
                        sliderInput('sliderqsec', 'Please select 1/4 mile time, seconds', min=10, max=30, 
                                    value=15, step=0.1) ),
                # This section of the ui file defines outputs that will be soursed from the server file.
                mainPanel(
                        h3("Predicted miles per gallons for the your parameters is:"), 
                        textOutput("mpg"),
                        plotOutput("plot1"),
                        plotOutput("plot2")
                )
        )
))
