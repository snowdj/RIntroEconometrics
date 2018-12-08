#load packages
library(tidyverse)
library(haven)

#Bring in Wooldridge data
crime <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Run a regression using modified data
lm(crmrte~taxperpolice,data=crime %>% mutate(taxperpolice=taxpc/polpc))

#Create a new variable
crime <- crime %>%
  mutate(taxperpolice=taxpc/polpc,
                centralurban=central*urban) %>%
  mutate(taxppsq = taxperpolice^2) %>%
  filter(urban==1) %>%
  select(county,year,crmrte,polpc,taxperpolice) %>%
  arrange(year,taxperpolice) %>%
  rename(crimerate=crmrte)


