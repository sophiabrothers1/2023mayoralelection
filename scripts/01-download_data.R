#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto - 2023 Mayoral Election Results
# Author: Sophia Brothers
# Date: 23 September 2024
# Contact: sophia.brothers@mail.utoronto.ca
# License: MIT
# Pre-requisites: opendatatoronto, tidyverse, readxl
# Any other information needed? N/A


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(readxl)
# [...UPDATE THIS...]
package <- show_package("97d72233-8681-4b3d-828e-4929d40d122c")

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]
resources <- package$resources
all_data <- data.frame()
for (i in 1:25) {
  ward_name <- paste0("Ward ", i)
  resource <- resources[grepl(ward_name, resources$name), ]
  
  if (nrow(resource) > 0) {
    temp_file <- tempfile(fileext = "2023 Office of the Mayor.xlsx")
    download.file(resource$url, temp_file, mode = "wb")
    
    ward_data <- read_excel(temp_file, sheet = ward_name) %>%
      mutate(Ward = ward_name)
    
    all_data <- bind_rows(all_data, ward_data)
    
    unlink(temp_file)
  }
}

#### Save data ####
# [...UPDATE THIS...]
write_csv(all_data, "data/raw_data/2023_mayoral_election_results.csv")
