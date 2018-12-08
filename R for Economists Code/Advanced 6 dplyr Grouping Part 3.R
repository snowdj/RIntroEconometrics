#load packages
library(tidyverse)
library(haven)

#Bring in Wooldridge data
crime <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Group our data
#Create the mean crmrte within each county
crime <- crime %>%
  group_by(county) %>%
  mutate(meancrimerate = mean(crmrte))

#Create summaries
crime %>%
  group_by(urban) %>%
  summarize(meancrimerate = mean(crmrte),mediancrimerate=median(crmrte),firstcr=first(crmrte))

#Check the number of observations with a mix of vairable
crime <- crime %>%
  group_by(county,year) %>%
  mutate(N = n())
table(crime$N)
#We know that county and year uniquely identify observations
#this is the observation level

#what if we thought it was county?
crime <- crime %>%
  group_by(county) %>%
  mutate(N = n())
table(crime$N)
