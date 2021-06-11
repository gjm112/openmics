#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Open Mics in Chicago (Based on Brian Roe's Spreadsheet)"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("time", 
                        label = h3("Time"), 
                        min = 4, 
                        max = 11, 
                        value = c(4, 11)),
            
            checkboxGroupInput("dayofweek", "Day of Week",
                               c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"), "Sunday")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            dataTableOutput("table")
            #plotOutput("distPlot")
        )
    )
))
