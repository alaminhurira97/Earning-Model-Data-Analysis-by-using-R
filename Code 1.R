# Creating a smaller data set
setwd("C:/HW#4")

# Reading the SAS format from ACS for 2019 and 2020
library(haven)
wi_2019<-read_sas("unix_pwi_2019.zip")
wi_2020<-read_sas("unix_pwi_2020.zip")

# Adding a variable to the dataset
wi_2019$YEARi<-2019
wi_2020$YEARi<-2020

# vertical concatenation of wi_2019 and wi_2020
wi<-rbind(wi_2019,wi_2020)

# selecting workers who have a positive salary (WAGP)
wiw<-subset(wi,WAGP>0)

# save the data set of workers
saveRDS(wiw,file="ACSwiw.Rda")