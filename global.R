rm(list = ls())

# Load libraries ----------------------------------------------------------

library(shiny)
library(lubridate)
library(dplyr)
library(leaflet)

# Define text about -------------------------------------------------------

text_about <- 
    "This data was compiled by Mother Jones, nonprofit founded in 1976. Originally covering cases from 1982-2012, this database has since been expanded numerous times to remain current."

# Read data of mass shootings ---------------------------------------------

mass_shootings_orig <- read.csv("data/Mother Jones - Mass Shootings Database, 1982 - 2021 - Sheet1.csv", 
                                stringsAsFactors = FALSE, header = TRUE)

# Preprocess data ---------------------------------------------------------

mass_shootings <- mass_shootings_orig %>%
    dplyr::mutate_at(.vars = dplyr::vars(dplyr::matches("date")), .funs = ~ lubridate::mdy(.))

# Print data --------------------------------------------------------------

print(
    str(subset(
        mass_shootings, 
        select = c(location, date, latitude, longitude, case, fatalities, summary)
    ))
)
