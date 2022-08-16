# Machine Failure Poisson Prediction

Use the Poisson distribution to predict the number of failures of a machine with this web app.

### Features in This App
* The user can select one of three machine failure probabilities to predict:
    1. Probability of machine failing exactly *x* times;
    2. Probability of machine failing less than *x* times;
    3. Probability of machine failing more than *x* times.
* The user inputs the expected number of failures informed by the machine manufacturer;
* A barplot visually provides the probability for *x* machine failures;
* Additionally, the barplot also shows the probability for *x-2*, *x-1*, *x+1* and *x+2* machine failures;
* The x-axis labels present the exact probability per number of failures, calculated using the Poisson distribution.

### User Interface Sample

![ui_machine-failure-poisson-prediction](https://user-images.githubusercontent.com/33037020/184787540-b3a1b518-de62-4929-aa47-128b9714ec14.JPG)

*[Shiny] is a framework that allows users to develop web apps using R and embedded web languages, such as CSS and HTML. Shiny apps focus on objectiveness and simplicity: only one or two R scripts have all the code for the app.*

*This app development started with knowledge and tools discussed during the course "Data Science Bootcamp" by Fernando Amaral. The app has been upgraded and personalized, adding new functionalities.*

[//]: #

[Shiny]: <https://www.shinyapps.io>
