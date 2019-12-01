

library(shiny)
library(dplyr)

shinyServer(function(input, output) {

    filedata <- reactive({
        infile <- input$fwf
        if (is.null(infile)) {
            # User has not uploaded a file yet
            return(NULL)
        }
        ReadACT(infile$datapath, year=input$mappingYear)
    })

    output$contents <- renderTable({
        df <- filedata()


            return(df)

    })

    fileReady <- reactive({
        infile <- input$fwf
        if (is.null(infile)) {
            # User has not uploaded a file yet
            return(FALSE)
        }
        return(TRUE)
    })
})
