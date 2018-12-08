#load packages
library(tidyverse)
library(haven)

#Bring in Wooldridge data
crime <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Build a scatterplot
ggplot(crime,aes(x=polpc,y=crmrte))+geom_point()

#In a ggplot command we need:
#1) Our data
#2) Our aesthetic aes()
#3) Our geometry