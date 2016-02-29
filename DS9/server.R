palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
# Example modified from the shinyapp.io site Gallery Section
# Define colors to use in the PLOT
# Server having interaction with the screen

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    # The mtcars data is used  
    mtcars[, c(input$xcol, input$ycol)]
  })
  # define clusters depending on the inputs    
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  # Generate PLOT    
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
})