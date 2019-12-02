library(shiny)
library(dplyr)

shinyServer(function(input, output) {

    ## read in the data
    filedata <- reactive({
        infile <- input$fwf
        if (is.null(infile)) {
            # User has not uploaded a file yet
            return(NULL)
        }

        # Check to see if the user has selected scores only.
        if(input$scoresOnly==F){
            #read in the file options for blanks
            ReadACT(infile$datapath,
                    year=input$mappingYear,
                    blanks=input$includeBlanks,
                    scores_only = input$scoresOnly
                    )
        }
        else{
            #read in the file no blanks
            ReadACT(infile$datapath,
                    year=input$mappingYear,
                    scores_only = input$scoresOnly
                    )
        }
    })

    # check if the file has been read in.
    fileReady <- reactive({
        infile <- input$fwf
        if (is.null(infile)) {
            # User has not uploaded a file yet
            return(FALSE)
        }
        return(TRUE)
    })


###### DYNAMIC UI ######

    ### Check if the user wants the blanks in the file. ###
    output$blanksCheckBox <-  renderUI({
        if(fileReady()==F){return(NULL)}
        if(input$scoresOnly==T){return(NULL)}
        checkboxInput("includeBlanks", "Include Blanks?", value = FALSE)
    })

    ### Allow the user to download the file. ###
    output$downloadFile <- renderUI({

    })

    ### Render the Table of student data ###
    output$contents <- renderTable({
        df <- filedata()
        return(df)
    })
})
