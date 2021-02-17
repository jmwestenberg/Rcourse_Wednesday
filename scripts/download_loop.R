#Download excel docs from bls, clean, and append

# clean workspace and environment (this is equivalent to clicking the brush buttons in RStudio)
cat("\014")
rm(list=ls())

### Put in your own folder path here
workingdir<-#"Path_to_your_main_folder"
# for example for me it may be workingdir<-"C:/Users/Documents/GitHub/Rcourse/"

#load in folder paths
source(paste0(workingdir, "workingdir.R"))

#load required packages
require(stringr)
require(readxl)

##############################################################

#see https://jmwestenberg.github.io/courses/rcourse/lesson1/lesson1_05/ for step by step explanation of loop
county_data<-data.frame()
years<-c(90:99, 0:19)
years<-str_pad(as.character(years), 2, "left", "0")
years_l<-length(years)
for (i in 1:years_l){
  url<-paste0("https://www.bls.gov/lau/laucnty", years[i], ".xlsx")
  destination<-paste0(folder_raw_data, "/bls_unemp_", years[i], ".xlsx")
  download.file(url, destination, mode="wb")
  temp_df <- read_excel(paste0(folder_raw_data, "/bls_unemp_", years[i], ".xlsx"), 
    col_names=FALSE, skip=5)
  temp_df<-temp_df[,-6]
  colnames(temp_df)<-c("LAUS_code", "State_fips", "County_fips", "County_name", "Year", 
    "Labor_force", "Employed", "Unemployed", "Unemp_rate")
  county_data<-rbind(county_data, temp_df)
}
unemp_data<-county_data[!is.na(county_data$State_fips),]
filename<-paste0(folder_processed_data, "/unemp_data.rda")
save(unemp_data, file=filename)