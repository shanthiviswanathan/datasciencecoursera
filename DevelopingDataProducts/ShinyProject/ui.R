library(shiny)

library(datasets)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Distribution of Sample Means"),
  
  # Sidebar with a slider and selection inputs
  sidebarLayout(
  sidebarPanel(
               selectInput("selection", strong("Choose from below:   Please make sure Plot tab is selected on the right"), 
                           choices = c("Nitric oxides concentration" = "NOX",
                                       "Average rooms" = "RM",
                                       "Pupil-Teacher ratio" = "PTRATIO",
                                       "% poor" = "LSTAT",
                                       "Median Home Value ($'000)" = "MEDV"),
                           selected = "MEDV"),
               hr(),
               sliderInput("samplesize", 
                           strong("Sample Size:"), 
                           min = 10,  max = 100, value = 25),
               hr(),
               sliderInput("noofsamples", 
                           strong("Number Of Samples:"), 
                           min = 10,  max = 1000,  value = 100),
               hr(),
               helpText("We are plotting the normalized value (aka z value) for each chosen column."),
               helpText("Note that as the sample size increases the variance of the distribution of the sample means decreases."),
               helpText("As the number of samples increases, the distribution of sample means comes closer and closer to the normal distribution."),
               helpText("This is an important application of the Central Limit Theorem.")
  ),
  
  # Show histogram
  mainPanel(
    tabsetPanel(
      tabPanel(strong("About"), includeHTML("Readme.html")),
      tabPanel(strong("Plot"), plotOutput("plot")), 
      tabPanel(strong("DataSet"), tableOutput("table"))
    )
  )
  )
))