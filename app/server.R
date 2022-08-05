library(shiny)

# Define server logic
shinyServer(function(input, output) {

    observeEvent(input$predictButtonID, {
        lambda = input$numericInputID
        type = input$radioButtonID
        
        startPredictionInterval = lambda - 2
        endPredictionInterval = lambda + 2
        
        predictions = as.character(startPredictionInterval:endPredictionInterval)
        
        if (type == 1) {
            y = dpois(startPredictionInterval:endPredictionInterval, lambda = lambda)
            z = as.character(round(y, 4))
            typeTitle = "Probability of failing exactly x times"
            labels = paste(predictions, "failures", "probability:", z)
        } 
        else if (type == 2) {
            y = ppois(startPredictionInterval:endPredictionInterval, lambda = lambda)
            z = as.character(round(y, 4))
            typeTitle = "Probability of failing less than x times"
            labels = paste("<", predictions, "failures", "probability:", z)
        } 
        else if (type == 3) {
            y = ppois(startPredictionInterval:endPredictionInterval, lambda = lambda, lower.tail = F)
            z = as.character(round(y, 4))
            typeTitle = "Probability of failing more than x times"
            labels = paste(">", predictions, "failures", "probability:", z)
        }
        
        output$probabilityPlotID = renderPlot({
            barplot(y, names.arg = labels, col = heat.colors(5, rev = T), ylim = c(0, 1), main = typeTitle)
            box()
        })
    })

})
