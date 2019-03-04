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
    sidebarLayout(
      sidebarPanel(
        radioButtons("plotType", "Plot type",
          c("Keyword: All"="all_tweets.png", "Keyword: Flu"="keyword_flu.png", "Keyword: Influenza"="keyword_influenza.png" )
        )
      ),
      mainPanel( 
        plotOutput("plot3", width="800px", height="600px"),
        plotOutput("plot2", width="800px", height="600px")
      )
    )
  )
)

