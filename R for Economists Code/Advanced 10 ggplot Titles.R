#load packages
library(tidyverse)
library(haven)

#Bring in Wooldridge data
crime <- read_dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Make sure it knows that urban is binary
ggplot(crime,aes(x=polpc,y=log(crmrte),color=factor(urban)))+
  geom_point()

#Add axis labels
ggplot(crime,aes(x=polpc,y=log(crmrte),color=factor(urban)))+
  geom_point()+xlab("Police Per Capita")+ylab("Log of Crime Rate")

#Add a graph title
ggplot(crime,aes(x=polpc,y=log(crmrte),color=factor(urban)))+
  geom_point()+xlab("Police Per Capita")+ylab("Log of Crime Rate")+
  ggtitle("Crime versus Police per Capita")

#make sure our legend values correspond
crime <- crime %>%
  mutate(Urban.Area = as.factor(ifelse(urban==1,"Urban","Not Urban")))
ggplot(crime,aes(x=polpc,y=log(crmrte),color=Urban.Area))+
  geom_point()+xlab("Police Per Capita")+ylab("Log of Crime Rate")+
  ggtitle("Crime versus Police per Capita")

#Make legend values correspond manually
ggplot(crime,aes(x=polpc,y=log(crmrte),color=factor(urban)))+
  geom_point()+xlab("Police Per Capita")+ylab("Log of Crime Rate")+
  ggtitle("Crime versus Police per Capita")+
  scale_color_manual(values=c(1,2),labels=c("Not Urban","Urban Area"))
