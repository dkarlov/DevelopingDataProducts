library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predcition of the diamond price"),
  
  
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
        helpText("Choose diamond description and diamond weight"),
        
        
        numericInput("carat", 
                     label = h3("Diamond weight in carats"), 
                     value = 1),
        selectInput("colour", 
                    label = "Choose colour type",
                    choices = list("D", "E", "F",
                                   "G", "H", "I"),
                    selected = "D"),
        selectInput("clarity", 
                    label = "Choose clarity type",
                    choices = list("IF", "VVS1",
                                   "VVS2", "VS1", "VS2"),
                    selected = "IF"),
        selectInput("cert",
                    label = "Choose certification type",
                    choices = list("GIA", "IGI", "HRD"),
                    selected = "GIA"),
        actionButton("calc", label = "Calculate price"),
        actionButton("reset", "Clear")
        ),
    
    mainPanel(
      img(src="diamond.png", height = 244, width = 206),
      textOutput("price")
    )
    )
    
    # Show a plot of the generated distributio
  )
)
