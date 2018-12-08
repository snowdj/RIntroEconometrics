#Load packages
library(foreign)
library(stargazer)
#Sandwich is for heteroskedasticity-robust and cluster-robust errors
library(sandwich)
#lmtest is for Breusch-Pagan
library(lmtest)
#AER is for linearHypothesis
library(AER)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

model3 <- lm(wage~educ+tenure+female+married,data=wage1)
#Robust standard errors
stargazer(model3,coeftest(model3,vcovHC),type='text')
#Clustered standard errors
stargazer(model3,coeftest(model3,vcovHC),
          coeftest(model3,vcovCL,cluster=wage1$smsa),type='text')

#Breusch-Pagan test
bptest(model3)

#F test of significance
#Test if the coefficient on educ is 0 
#(note that the p-value of this) test will be exactly the same 
#as the p-value of the t-test for that coefficient reported in
#the regression table
linearHypothesis(model3,"educ=0",type=c("F"))
#Joint test that the coefficient on educ AND the coefficient on female
#are both 0
linearHypothesis(model3,c("educ=0","female=0"),type=c("F"))
#Joint test of every variable in the model. The F-statistic here
#is the same F-statistic reported for the whole model at the
#bottom of the regression table.
linearHypothesis(model3,c("educ=0","female=0","tenure=0","married=0"),type=c("F"))

