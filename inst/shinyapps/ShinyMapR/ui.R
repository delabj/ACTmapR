# This is a simple UI for people to use the ACT mapping

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("ACTmapR"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(fileInput("fwf", "Upload the ACT Fixed Width File",
                               multiple = TRUE,
                               accept = c("text/csv",
                                          "text/comma-separated-values,text/plain",
                                          ".txt")),
            selectInput('mappingYear', label = 'Select Mapping Year',
                        choices=c('18-19','19-20'),
                        selected = NULL, multiple = FALSE,
                        selectize = TRUE, width = NULL, size = NULL
                        )
        ),
        mainPanel(
            tableOutput("contents")

        )
    )
))
