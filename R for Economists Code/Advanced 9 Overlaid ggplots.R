#load packages
library(tidyverse)
library(haven)

#Bring in Wooldridge data
crime <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Do a scatterplot
ggplot(crime,aes(x=polpc,y=log(crmrte)))+geom_point()+
  geom_smooth(method='lm')

#Do a scatterplot with a mean line
ggplot(crime,aes(x=polpc,y=log(crmrte)))+geom_point()+
  geom_hline(aes(yintercept=mean(log(crmrte))))

#Get a density plot
ggplot(crime,aes(x=polpc))+geom_density()+coord_cartesian(xlim=c(0,.005))+
  geom_vline(aes(xintercept=mean(polpc)))

#Do a scatterplot
ggplot(crime,aes(x=polpc,y=log(crmrte),color=urban))+geom_point()
#Make sure it knows that urban is binary
ggplot(crime,aes(x=polpc,y=log(crmrte),color=factor(urban)))+geom_point()
#Use shape of the dots instead of the color
ggplot(crime,aes(x=polpc,y=log(crmrte),shape=factor(urban)))+geom_point()

#Get a density plot
ggplot(crime,aes(x=polpc,color=factor(urban)))+geom_density()

#Do a line graph
crime %>% group_by(year) %>% summarize(polpc = mean(polpc))
ggplot(crime %>% group_by(year,urban) %>% summarize(polpc = mean(polpc)),
       aes(x=year,y=polpc,color=factor(urban)))+
  geom_line()
ggplot(crime %>% group_by(year,urban) %>% summarize(polpc = mean(polpc)),
       aes(x=year,y=polpc,linetype=factor(urban)))+
  geom_line()
