#load packages
library(tidyverse)
library(haven)

#Bring in Wooldridge data
crime <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Create a new variable
crime <- mutate(crime,taxperpolice=taxpc/polpc,
                centralurban=central*urban)

#Select some rows
urbanonly <- filter(crime,urban==1)

#Select some columns
regdata <- select(crime,crmrte,polpc)
#Select columns using starts_with()
clonly <- select(crime,starts_with("cl"))

#Sort the data using arrange
crime <- arrange(crime,crmrte)
crime <- arrange(crime,year,crmrte)

#Rename a variable
crime <- rename(crime,crimerate=crmrte)
