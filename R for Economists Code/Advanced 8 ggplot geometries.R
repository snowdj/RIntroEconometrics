#load packages
library(tidyverse)
library(haven)

#Bring in Wooldridge data
crime <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Do a scatterplot
ggplot(crime,aes(x=polpc,y=log(crmrte)))+geom_point()

#Do a bar graph
ggplot(crime,aes(x=urban))+geom_bar()

#Get a histogram
ggplot(crime,aes(x=polpc))+geom_histogram()

#Get a density plot
ggplot(crime,aes(x=polpc))+geom_density()
#Get rid of that baseline
ggplot(crime,aes(x=polpc))+stat_density()
#Limit the window
ggplot(crime,aes(x=polpc))+stat_density()+
  coord_cartesian(xlim=c(0,.005))

#Do a line graph
crime %>% group_by(year) %>% summarize(polpc = mean(polpc))
ggplot(crime %>% group_by(year) %>% summarize(polpc = mean(polpc)),
       aes(x=year,y=polpc))+
  geom_line()

#Plot a regression
ggplot(crime,aes(x=polpc,y=log(crmrte)))+geom_smooth(method="lm")
