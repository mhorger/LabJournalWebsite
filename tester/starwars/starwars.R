#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(data.table)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Star Wars Data"),
   
   # Sidebar with a slider input so that we can sort by age
   sidebarLayout(
      sidebarPanel(
        sliderInput("Height_range", 
                    label = h3("Pick height range"), 
                    min = min(starwars$height, na.rm = TRUE), 
                    max = max(starwars$height, na.rm = TRUE), 
                    value = c(100, 150))
      )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         tableOutput("SW")
      )
   )


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$SW <- renderTable({
     a <- starwars[,1:10]
   })
   output$range <- renderPrint({ input$Height_range })
}

# Run the application 
shinyApp(ui = ui, server = server)

