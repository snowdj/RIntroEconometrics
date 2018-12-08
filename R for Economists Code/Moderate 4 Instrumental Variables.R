#Load packages
library(foreign)
library(stargazer)
library(AER)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Basic model
model3 <- lm(wage~educ+tenure+female+married,data=wage1)
stargazer(model3,type='text')

#Perform an instrumental variables regression
ivmodel <- ivreg(wage~educ+tenure+female+married|smsa+tenure+female+married,data=wage1)
stargazer(ivmodel,type='text')
firststage <- lm(educ~smsa+tenure+female+married,data=wage1)
stargazer(firststage,type='text')
linearHypothesis(firststage,"smsa=0",type=c("F"))
