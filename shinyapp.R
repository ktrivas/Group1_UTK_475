library(shiny)
library(fpp3)
data(tourism)
attach(tourism)

ui <- fluidPage(
  plotOutput("REGIONS"),
  
  radioButtons(inputId = "Purpose", label = "What is the purpose of your visit?", c("All Plots" = "A",
                                                                                    "Business" = "B",
                                                                                    "Holiday" = "H",
                                                                                    "Visiting" = "V",
                                                                                    "Other" = "O"))
)

server <- function(input, output, session) {
  
  output$REGIONS <- renderPlot({
    if (input$Purpose == "B") {
      PLOT <- filter(tourism, Region == "Adelaide", Purpose == "Business")
      autoplot(PLOT)
    } else if (input$Purpose == "H") {
      PLOT <- filter(tourism, Region == "Adelaide", Purpose == "Holiday")
      autoplot(PLOT)
    } else if (input$Purpose == "V") {
      PLOT <- filter(tourism, Region == "Adelaide", Purpose == "Visiting")
      autoplot(PLOT)
    } else if (input$Purpose == "O") {
      PLOT <- filter(tourism, Region == "Adelaide", Purpose == "Other")
      autoplot(PLOT)
    } else if (input$Purpose == "A")
      PLOT <- filter(tourism, Region == "Adelaide")
      autoplot(PLOT)
  })
}

shinyApp(ui, server)