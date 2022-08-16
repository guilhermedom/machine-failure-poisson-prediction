library(shiny)

# Define server logic
shinyServer(function(input, output) {

    observeEvent(input$predictButtonID, {
        lambda = input$numericInputID
        type = input$radioButtonID
        
        startPredictionInterval = lambda - 2
        endPredictionInterval = lambda + 2
        
        predictions = startPredictionInterval:endPredictionInterval
        
        if (type == 1) {
            y = dpois(startPredictionInterval:endPredictionInterval, lambda = lambda)
            z = round(y, 4)
            typeTitle = paste("Probability of failing exactly", lambda, "times")
            labels = paste("Exactly", predictions, "failures\n", "probability:", z * 100, "%")
        } 
        else if (type == 2) {
            y = ppois(startPredictionInterval:endPredictionInterval, lambda = lambda)
            z = round(y, 4)
            typeTitle = paste("Probability of failing less than", lambda, "times")
            labels = paste("Less than", predictions, "failures\n", "probability:", z * 100, "%")
        } 
        else if (type == 3) {
            y = ppois(startPredictionInterval:endPredictionInterval, lambda = lambda,
                      lower.tail = F)
            z = round(y, 4)
            typeTitle = paste("Probability of failing more than", lambda, "times")
            labels = paste("More than", predictions, "failures\n", "probability:", z * 100, "%")
        }
        
        output$probabilityPlotID = renderPlot({
            barplot(y, names.arg = labels, col = heat.colors(5, rev = T),
                    ylim = c(0, 1), main = typeTitle)
            box()
        })
    })

})
