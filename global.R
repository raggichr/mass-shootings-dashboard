rm(list = ls())

# Load libraries ----------------------------------------------------------

library(lubridate)
library(dplyr)

# Define text about -------------------------------------------------------

text_about <- 
    "This data was compiled by Mother Jones, nonprofit founded in 1976. Originally covering cases from 1982-2012, this database has since been expanded numerous times to remain current."

# Read data of mass shootings ---------------------------------------------

mass_shootings_orig <- read.csv("data/Mother Jones - Mass Shootings Database, 1982 - 2021 - Sheet1.csv", 
                                stringsAsFactors = FALSE, header = TRUE)

# Preprocess data ---------------------------------------------------------

mass_shootings <- mass_shootings_orig %>%
    mutate_at(.vars = vars(dplyr::matches("date")), .funs = ~ lubridate::mdy(.))

# Print data --------------------------------------------------------------

str(
    subset(
        mass_shootings, 
        select = c(location, date, latitude, longitude, case, fatalities, summary)
        )
    )
