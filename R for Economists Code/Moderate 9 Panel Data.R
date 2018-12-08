#Load packages
library(foreign)
library(plm)
library(stargazer)

#Load in Wooldridge data on crime
crime <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")

#Declare our data to be a panel data set
crime.p <- pdata.frame(crime,index=c("county","year"))

#Run a panel model
#fixed effects / within
fixedeff <- plm(log(crmrte)~polpc,data=crime.p,model="within")
stargazer(fixedeff,type='text')
#Random effects
randomeff <- plm(log(crmrte)~polpc,data=crime.p,model="random")
stargazer(randomeff,type='text')
#First difference effects
firstdiff <- plm(log(crmrte)~polpc,data=crime.p,model="fd")
stargazer(firstdiff,type='text')

#Run a hausman test comparing random and fixed effects
phtest(fixedeff,randomeff)

#Include a lag
fixedeffwithlag <- plm(log(crmrte)~lag(log(crmrte))+polpc,data=crime.p,model="within")
stargazer(fixedeffwithlag,type='text')

#Cluster standard errors at the individual level
coeftest(fixedeff,vcovHC(fixedeff,type="HC0",cluster="group"))
