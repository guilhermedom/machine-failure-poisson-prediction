library(shiny)
library(shinythemes)

# Define UI for application
shinyUI(fluidPage(
    theme = shinytheme("lumen"),

    # Application title
    titlePanel(h1("Machine Failure Prediction Using Poisson Distribution", align = "center")),
    br(),
    br(),

    fluidRow(
        column(6, align = "center", radioButtons("radioButtonID", label = "Select probability to predict:",
               choices = list("Probability of failing exactly x times" = 1,
                              "Probability of failing less than x times" = 2,
                              "Probability of failing more than x times" = 3),
               selected = 1)),
        column(6, align = "center", numericInput("numericInputID", "Average number of failures informed by the machine manufacturer:", value = 2, min = 1, max = 999),
               actionButton("predictButtonID", "Predict!"))
    ),
    fluidRow(
        column(12, plotOutput("probabilityPlotID"))
    )
))
