navbarPage("Flu heatmap analysis",
  tabPanel("CDC heatmap",
      mainPanel(
        plotOutput("plot1")
      )
  ),
  tabPanel("Twitter heatmap",
      mainPanel(
        plotOutput("plot4")
      )
  ),
  tabPanel("CDC vs twitter",
      mainPanel( 
        div(
          radioButtons("plotType", "Filter by keyword:",
          c("Keyword: All"="all_tweets.png", "Keyword: Flu"="keyword_flu.png", "Keyword: Influenza"="keyword_influenza.png" )
          )
        ),
        fluidRow(
          column(6,plotOutput('plot3')),
          column(6,plotOutput('plot2'))
        ), width="100%"
      )
    )
  )

