#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto - 2023 Mayoral Election Results
# Author: Sophia Brothers
# Date: 23 September 2024
# Contact: sophia.brothers@mail.utoronto.ca
# License: MIT
# Pre-requisites: opendatatoronto, tidyverse, dplyr
# Any other information needed? N/A


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

# get package from opendatatoronto
package <- show_package("97d72233-8681-4b3d-828e-4929d40d122c")
resources <- list_package_resources(package)

# select the 2023 mayoral byelection specifically from the package
resource_2 <- resources[2, ]
the_raw_data <- get_resource(resource_2)


#### Download data ####

# convert into a CSV
for (i in seq_along(the_raw_data)) {
  if (is.data.frame(the_raw_data[[i]])) {
    write_csv(the_raw_data[[i]], paste0("raw_data", i, ".csv"))
  }
}
