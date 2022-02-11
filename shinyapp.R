library(shiny)
library(fpp3)
data(tourism)

ui <- fluidPage(
  plotOutput("REGIONS")
)

server <- function(input, output, session) {
  
  output$REGIONS <- renderPlot({PLOT <- filter(tourism, Region == "Adelaide")
                                autoplot(PLOT)}, res = 96
  )
}

shinyApp(ui, server)