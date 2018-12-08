#Load packages
library(foreign)
library(censReg)
library(stargazer)
library(sampleSelection)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Make everything below 3 for wage equal to 3
#We're faking some censored data here.
wage1[wage1$wage<3,]$wage <- 3

#Run our Tobit
tobitmodel <- censReg(wage~female+educ+tenure,data=wage1,left=3)
stargazer(tobitmodel,type='text')

#Get marginal effects for Tobit
margEff(tobitmodel)

#Now we want everything 3 or below to be missing
#We're faking sample selection here
wage1[wage1$wage==3,]$wage <- NA

#Run a Heckman selection model
heckmodel <- selection(!is.na(wage)~female+educ+tenure+south,wage~female+educ+tenure,data=wage1)
stargazer(heckmodel,type='text')
