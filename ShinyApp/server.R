

function(input, output, session) {
  output$plot1 <- renderImage({
      filename <- normalizePath(file.path('./images',
                                          'ili_heatmap.png'))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("ILI Heatmap"))
      
    }, deleteFile = FALSE)

  output$plot2 <- renderImage({
      filename <- normalizePath(file.path('./images',
                                          input$plotType))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("ILI Heatmap"))
      
    }, deleteFile = FALSE)

  output$plot3 <- renderImage({
      filename <- normalizePath(file.path('./images',
                                          'ili_heatmap.png'))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("ILI Heatmap"))
      
    }, deleteFile = FALSE)


  output$plot4 <- renderImage({
      filename <- normalizePath(file.path('./images',
                                          'all_tweets.png'))
      
      # Return a list containing the filename and alt text
      list(src = filename,
           alt = paste("ILI Heatmap"))
      
    }, deleteFile = FALSE)

  output$summary <- renderPrint({
    summary(cars)
  })
}

