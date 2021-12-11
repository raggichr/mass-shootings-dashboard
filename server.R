#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    observeEvent(input$show_about, {
        showModal(modalDialog(.GlobalEnv$text_about, title = "About"))
    })
    
    rval_mass_shootings <- reactive({
        .GlobalEnv$mass_shootings %>% 
            filter(
                .data$date >= input$date_range[1],
                .data$date <= input$date_range[2],
                .data$fatalities >= input$nb_fatalities
            )
    })
    
    output$map <- leaflet::renderLeaflet({
        rval_mass_shootings() %>% 
            leaflet() %>% 
            setView( -98.58, 39.82, zoom = 4) %>% 
            addTiles() %>% 
            addCircleMarkers(
                popup = ~ summary, 
                radius = ~ sqrt(fatalities)*3,
                fillColor = "red", 
                color = "red", 
                weight = 1
            )
    })
    
}
