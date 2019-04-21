library(ggplot2)
library(ggthemes)
library(purrr)
library(fs)
library(lubridate)
library(janitor)
library(tidyverse)

file_list <- dir_ls("../transplant_data")

all_donations <- map_dfr(file_list, 
                     read_csv, 
                     .id = NULL,
                     col_names = c("country",
                                   "year",
                                   "organ",
                                   "transplants",
                                   "measure",
                                   "donor_status"),
                     col_types = cols(
                       country = col_character(),
                       year = col_double(),
                       organ = col_character(),
                       transplants = col_character(),
                       measure = col_character(),
                       donor_status = col_character()
                     ))

saveRDS(all_donations, "all_donations.RDS", compress = TRUE)
