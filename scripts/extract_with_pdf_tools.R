# set-up
remove(list=ls())

# load librairies
library(tidyverse)
library(pdftools)

# Wild Juvenile Salmonid Monitoring Program Broughton Archipelago 2016
# link to document: https://corpsite.azureedge.net/corpsite/wp-content/uploads/sites/7/2019/08/broughton-wild-juvenile-salmonid-monitoring-2016.pdf
# source: https://mowi.com/caw/sustainability/wild-salmonid-lice-monitoring/

# read PDF document 
content <- pdf_text("C:/Users/Mimeaultc/Desktop/sea-lice/broughton-wild-juvenile-salmonid-monitoring-2016.pdf")

# look at the content of a page (here page 66 as an example)
cat(content[66])



pdf_info(content)




# read PDF document and open it inside R
mypdf <- pdf_text("C:/Users/Mimeaultc/Desktop/sea-lice/broughton-wild-juvenile-salmonid-monitoring-2016.pdf") %>%
  readr::read_lines()
mypdf

content <- pdf_text("C:/Users/Mimeaultc/Desktop/sea-lice/broughton-wild-juvenile-salmonid-monitoring-2016.pdf")

# look at the content of a page (here page 66 as an example)
cat(content[66])


# remove lines that are not in the appendix
sealice_appendix <- mypdf[-c(1:1349)]
sealice_appendix

# remove page numbers and repeated table headers
sealice_data <- sealice_appendix[-c(38:42,
                                    81:85,
                                    124:128,
                                    167:171,
                                    210:214,
                                    253:257,
                                    296:300,
                                    339:343,
                                    382:386,
                                    425:429,
                                    468:472,
                                    511:515,
                                    554:558,
                                    597:601,
                                    640:644,
                                    681:685,
                                    722:726,
                                    763:767,
                                    804:808,
                                    845:849,
                                    886:890,
                                    927:931,
                                    968:972,
                                    1009:1013,
                                    1050:1054,
                                    1091:1095,
                                    1103)] 
View(sealice_data)

# double check that no data were removedin previous step
# by extracting the same page numbers and repeated table headers
# and then inspecting with View()
verification <- sealice_appendix[c(38:42,
                                    81:85,
                                    124:128,
                                    167:171,
                                    210:214,
                                    253:257,
                                    296:300,
                                    339:343,
                                    382:386,
                                    425:429,
                                    468:472,
                                    511:515,
                                    554:558,
                                    597:601,
                                    640:644,
                                    681:685,
                                    722:726,
                                    763:767,
                                    804:808,
                                    845:849,
                                    886:890,
                                    927:931,
                                    968:972,
                                    1009:1013,
                                    1050:1054,
                                    1091:1095,
                                    1103)]
View(verification)

# no data in verification, so it is reasonable to assume that sealice_data is complete (starting on page V)

# create the variable names based on table header in Appendix III
variable_names <- c("sample_date", "site", "site_name", "fish_species", "length_mm", "weight_g", "LEP_Co", "LEP_C1", "LEP_C2", "LEP_C3", "LEP_C4", "LEP_PAM", "LEP_PAF", "LEP_AM", "LEP_AF", "LEP_TOTAL", "CAL_Co", "CAL_C1", "CAL_C2", "CAL_C3", "CAL_C4", "CAL_PAM", "CAL_PAF", "CAL_AM", "CAL_AF", "CAL_TOTAL") # create your variable names

# remove empty spaces in the lines of data - ******DOES NOT WORK AS FARM NAME VARIES IN LENGTH******
no_space <- sealice_data[4:972] %>%
  str_squish() %>%
  strsplit(split = " ")

#create a data frame
df <- ldply(sealice_data_no_space, data.frame) 
head(df)


df <- do.call(rbind.data.frame, no_space)


# useful resources:
# https://rstudio-pubs-static.s3.amazonaws.com/415060_553527fd13ed4f30aae0f1e4483aa970.html