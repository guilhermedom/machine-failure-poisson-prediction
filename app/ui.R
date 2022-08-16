library(shiny)
library(shinythemes)

# Define UI for application
shinyUI(fluidPage(
    theme = shinytheme("lumen"),

    # Application title
    titlePanel(h1("Machine Failure Prediction Using the Poisson Distribution",
                  align = "center"),
               windowTitle = "Machine Failure Prediction Using the Poisson Distribution"),
    
    br(),
    br(),

    fluidRow(
        column(6, align = "center",
               radioButtons("radioButtonID", label = "Select probability to predict:",
               choices = list("Probability of machine failing exactly x times" = 1,
                              "Probability of machine failing less than x times" = 2,
                              "Probability of machine failing more than x times" = 3),
               selected = 1)),
        column(6, align = "center",
               numericInput("numericInputID", "Expected number of failures
                            informed by the machine manufacturer:",
                            value = 2, min = 1, max = 999),
               actionButton("predictButtonID", "Predict!"))
    ),
    fluidRow(
        column(12, plotOutput("probabilityPlotID"))
    )
))
