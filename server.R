library(Ecdat)
library(DAAG)
library(shiny)


data(Diamond)

fit=lm(price ~ carat^2 + clarity*carat^2 + colour*carat^2 + certification*carat^2, data=Diamond)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  v <- reactiveValues(data = NULL)
  
  observeEvent(input$calc, {
    dat <- data.frame(carat = input$carat, colour = input$colour,
                      clarity = input$clarity, certification = input$cert)
    pr <- predict(fit, newdata = dat, interval="confidence")
    v$data <- paste("Predicted interval of price lies beetween", pr[,2],"and", pr[,3], "Singapour $ with 95% probability")
    })
  output$price <- renderText({
    v$data
    })
})
  
