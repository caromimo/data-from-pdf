################################################################################
# Script to extract data from tables in a PDF
# C. Mimeault
# April 2021
################################################################################
# PDF name: Wild Juvenile Salmonid Monitoring Program Broughton Archipelago 2016
# Source: https://mowi.com/caw/sustainability/wild-salmonid-lice-monitoring/
################################################################################

# set-up
remove(list=ls())

# load libraries
library(tidyverse)
library(here)
library(tabulizer)
library(lubridate)

# link to the PDF
# https://corpsite.azureedge.net/corpsite/wp-content/uploads/sites/7/2019/08/broughton-wild-juvenile-salmonid-monitoring-2016.pdf

# path to the PDF saved locally
my_pdf <- here("data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2016.pdf")

# create an empty dataframe in which to save the data to be extracted from the PDF
appendix_III <- data.frame(matrix(ncol = 26, nrow = 0))

# extract data from specific pages in the PDF and save to the PDF
for (i in 45:71){
  page <- as.data.frame(extract_tables(my_pdf, page = i, method = 'stream'), stringsAsFactors = FALSE)
  page <- page[c(-1,-2,-3), ]
  appendix_III <- rbind(appendix_III, page)
}

# collect removed lines to ensure no data were lost
verification <- data.frame(matrix(ncol = 26, nrow = 0))
for (i in 45:71){
  page <- as.data.frame(extract_tables(my_pdf, page = i, method = 'stream'), stringsAsFactors = FALSE)
  page <- page[c(1,2,3), ]
  verification <- rbind(verification, page)
}
# visually inspect the removed lines - seems okay
View(verification)

# specify column names as per table header in Appendix III (pages 45 to 71) of the document
column_names <- c("sample_date", "site", "site_name", "fish_species", "length_mm", "weight_g", "LEP_Co", "LEP_C1", "LEP_C2", "LEP_C3", "LEP_C4", "LEP_PAM", "LEP_PAF", "LEP_AM", "LEP_AF", "LEP_TOTAL", "CAL_Co", "CAL_C1", "CAL_C2", "CAL_C3", "CAL_C4", "CAL_PAM", "CAL_PAF", "CAL_AM", "CAL_AF", "CAL_TOTAL") # create your variable names

# add column names to extracted data
colnames(appendix_III) <- column_names

# clean csv (names of new columns are followed with nc for new column)
appendix_III <- appendix_III %>%
  mutate(
    sample_date_nc = dmy(sample_date),
    year_sample_nc = as.factor(year(sample_date_nc)),
    month_sample_nc = as.factor(month(sample_date_nc)),
    area_nc = "Broughton Archipelago",
    source_nc = "industry data",
    reference_nc = "Wild Juvenile Salmonid Monitoring Program Broughton Archipelago 2016"
    )

# visualise the dataframe
View(appendix_III)

# save to a csv file (in interim data as the final processed data will include all years)
write_csv(appendix_III, here("data/interim/broughton_archipelago_2016.csv"))

# useful resources:
# https://rstudio-pubs-static.s3.amazonaws.com/415060_553527fd13ed4f30aae0f1e4483aa970.html
# https://datascienceplus.com/extracting-tables-from-pdfs-in-r-using-the-tabulizer-package/
# https://stackoverflow.com/questions/52186788/extracting-tables-from-pdf-in-r