library(shiny)
shinyServer(function(input, output) {
        # This section runs a linear multivariate model of the MPG on car's weight, 1/4 mile running time and type of 
        # of transmission (manual versus automatic). Then it defines a reactive function predicting the MPG based on
        # the inputs provided in the UI file.        
        model<-lm(mpg~wt+qsec+factor(am),data=mtcars)
        pred<-reactive({
                amInput<-input$radioam
                wtInput<-input$sliderwt
                qsecInput<-input$sliderqsec
                predict(model, newdata=data.frame(am=amInput,wt=wtInput,qsec=qsecInput))
        })
        
        # Rendering the values of MPG   
        output$mpg<-renderText({pred()}) 
        
        # Ploting the MPG~weight dependency and the predicted point. 
        output$plot1 <- renderPlot({
                plot(x=mtcars$wt, y=mtcars$mpg, col = factor(mtcars$am),
                     xlab="Weight, 1000 lb", ylab="Miles per Galon", pch=17, cex=1)
                wtInput<-input$sliderwt
                points(x=wtInput,pred(), col="brown", pch=16, cex=2)
                
        })
        # Ploting the MPG~1/4 mile time dependency and the predicted point. 
        output$plot2 <- renderPlot({
                plot(x=mtcars$qsec, y=mtcars$mpg, col = factor(mtcars$am),
                     xlab="1/4 mile time", ylab="Miles per Galon", pch=18, cex=2)
                qsecInput<-input$sliderqsec
                points(x=qsecInput,pred(), col="blue", pch=16, cex=2)
        })
        
})
