#Load packages
library(foreign)
library(tidyverse)
library(stargazer)
library(haven)

#Read Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Create a tibble version of wage1
wage1.t <- as.tibble(wage1)

#Look at the data with head
head(wage1)
head(wage1.t)

#Use glimpse instead
glimpse(wage1.t)

#Generally, treat it like a data frame
mean(wage1.t$wage)

#Get summary stats with stargazer - we need to make it a data.frame
stargazer(as.data.frame(wage1.t),type='text')

#Read in Wooldridge data as a tibble directly
wage1haven <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")
