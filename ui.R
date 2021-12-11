#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Define UI for application that draws a histogram
ui <- bootstrapPage(
    
    # Add theme
    theme = shinythemes::shinytheme("simplex"),
    
    # Add map
    leaflet::leafletOutput("map", width = "100%", height = "100%"),
    
    # Add panel at the top-right
    absolutePanel(
        top = 10, right = 10, id = "controls",
        sliderInput("nb_fatalities", "Minimum Fatalities", 1, 40, 10),
        dateRangeInput(
            "date_range", 
            "Select Date", 
            min(.GlobalEnv$mass_shootings$date),
            max(.GlobalEnv$mass_shootings$date)
        ),
        actionButton(
            inputId = "show_about",
            label = "About")
    ),
    
    # Add HTML style
    shiny::tags$style(
        type = "text/css",
        "html, body {width:100%;height:100%}
            #controls{background-color:white;padding:20px;}"
    )
)

# Run the application 
# shinyApp(ui = ui, server = server)
