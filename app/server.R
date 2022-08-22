library(shiny)

# Define server logic.
shinyServer(function(input, output) {
    # All events from the app are processed once the "Predict!" button is clicked.
    observeEvent(input$predictButtonID, {
        lambda = input$numericInputID
        type = input$radioButtonID
        
        # We predict the number of failuers selected by the user with a range of  
        # +2 and -2 around it. This is done to conveniently provide more information.
        startPredictionInterval = lambda - 2
        endPredictionInterval = lambda + 2
        
        predictions = startPredictionInterval:endPredictionInterval
        
        # There are 3 types of prediction:
        # 1. Probability of failing exactly the input number of times;
        # 2. Probability of failing less than the input number of times;
        # 3. Probability of failing more than the input number of times.
        if (type == 1) {
            y = dpois(startPredictionInterval:endPredictionInterval, lambda = lambda)
            z = round(y, 4)
            typeTitle = paste("Probability of failing exactly", lambda, "times")
            labels = paste("Exactly", predictions, "failures\n", "probability:", z * 100, "%")
        } else if (type == 2) {
            y = ppois(startPredictionInterval:endPredictionInterval, lambda = lambda)
            z = round(y, 4)
            typeTitle = paste("Probability of failing less than", lambda, "times")
            labels = paste("Less than", predictions, "failures\n", "probability:", z * 100, "%")
        } else if (type == 3) {
            y = ppois(startPredictionInterval:endPredictionInterval, lambda = lambda,
                      lower.tail = F)
            z = round(y, 4)
            typeTitle = paste("Probability of failing more than", lambda, "times")
            labels = paste("More than", predictions, "failures\n", "probability:", z * 100, "%")
        }
        
        # The plot axis have their labels transformed from decimal to percentage,
        # i.e. 0.5 --> 50%.
        #
        # Heat colors in graph are reversed to be more warmer as they increase
        # because more failures are worse.
        y_percentage = y * 100
        output$probabilityPlotID = renderPlot({
            barplot(y_percentage, main = typeTitle, names.arg = labels, font.axis = 2,
                    col = heat.colors(5, rev = T), ylim = c(0, 100), yaxt='n')
            axis(2, at = c(0, 20, 40, 60, 80, 100),
                 labels = c("0 %", "20 %", "40 %", "60 %", "80 %", "100 %"), font = 2)
            box()
        })
    })

})
