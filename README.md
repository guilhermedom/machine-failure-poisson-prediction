# Machine Failure Poisson Prediction

Poisson distribution to predict number of failures of a machine.

---

## Usage

Install the Shiny R package on your machine by running the following command on your R console:

```
install.packages("shiny")
```

Once finished installing, clone or download this repository and open the "app.R" file with Rstudio. Rstudio will automatically detect that it is a Shiny app file and a "Run App" button will appear on the top of the editor screen. Click the button to run the app.

Alternatively, with the repository cloned, open your R console and set the working directory to the absolute path where the repository was cloned:

```
setwd(path_to_cloned_repository)
```

Then, load the Shiny library and run the app by passing the directory having the app files "ui.R" and "server.R":

```
library(shiny)
runApp("app")
```

The app will start on a new browser tab in your default browser.

## App Features

* The user can select one of three machine failure probabilities to predict:
    1. Probability of machine failing exactly *x* times;
    2. Probability of machine failing less than *x* times;
    3. Probability of machine failing more than *x* times.
* The user inputs the expected number of failures informed by the machine manufacturer;
* A barplot visually provides the probability for *x* machine failures;
* Additionally, the barplot also shows the probability for *x-2*, *x-1*, *x+1* and *x+2* machine failures;
* The x-axis labels present the exact probability per number of failures, calculated using the Poisson distribution.

## User Interface Sample

![ui_machine-failure-poisson-prediction](https://user-images.githubusercontent.com/33037020/184787540-b3a1b518-de62-4929-aa47-128b9714ec14.JPG)

*[Shiny] is a framework that allows users to develop web apps using R and embedded web languages, such as CSS and HTML. Shiny apps focus on objectiveness and simplicity: only one or two R scripts have all the code for the app.*

*This app development started with knowledge and tools discussed during the course "Data Science Bootcamp" by Fernando Amaral. The app has been upgraded and personalized, adding new functionalities.*

[//]: #

[Shiny]: <https://www.shinyapps.io>
