#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    openmics <- read.csv("openmics.csv")
    openmics$dayofweek <- factor(openmics$dayofweek, levels = c("Sunday",
                                                                "Monday",
                                                                "Tuesday",
                                                                "Wednesday",
                                                                "Thursday",
                                                                "Friday",
                                                                "Saturday"))
    output$table <- renderDataTable({
        
        openmics %>% arrange(dayofweek,timenum) %>% subset(dayofweek %in% input$dayofweek & timenum <= input$time[2] & timenum >= input$time[1])  %>% select(-timenum)
        
       
    })
    
    
})
