library(shiny)

# Rely on the 'housing' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  housing <- read.csv("data/BostonHousing.csv")
  
  generateSample <- function (dat, ind, size) {
    sam = sample(1:nrow(dat),size,replace=F)
    dat[sam,ind]
  }
  
  generateSampleMeans <- function (dat,ind,size,noofsamp) {
    means <- vector()
    for (n in 1:noofsamp) {
      sam <- generateSample(dat,ind,size)
      means <- c(means,mean(sam)) 
    }
    means
  }
  
  output$plot <- renderPlot({
    
    data <- generateSampleMeans(housing,input$selection,input$samplesize,input$noofsamples)
    data <- scale(data)
    hist(data, freq = FALSE, probability=TRUE,
         main=paste("Histogram of ", input$selection),
         xlab = input$selection)
  
    lines(density(data), col="blue", lwd=2) # add a density estimate with defaults
    
  })
  
  output$table <- renderTable({
    housing
  })
  
  output$about <- renderPrint({
    includeHTML("Readme.html")
  })
  
})
