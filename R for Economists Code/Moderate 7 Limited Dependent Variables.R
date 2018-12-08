#Load packages
library(foreign)
library(stargazer)
library(mfx)
library(MASS)
library(erer)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")


#Run a probit model
probitmodel <- glm(married~female+educ+northcen+south+west,data=wage1,family=binomial(link=probit))
stargazer(probitmodel,type='text')

#Run a logit model
logitmodel <- glm(married~female+educ+northcen+south+west,data=wage1,family=binomial(link=logit))
stargazer(logitmodel,type='text')

#Get marginal effects for probit
#atmean = TRUE averages the independent variables, and then
#calculates marginal effects for the "mean person".
#Also known as "marginal effects at the mean"

#atmean = FALSE calculates the marginal effect for each person
#in the sample, and then averages THOSE together.
#Also known as "average marginal effects"
probitmfx(probitmodel,atmean=TRUE,data=wage1)
probitmfx(probitmodel,atmean=FALSE,data=wage1)

#Get marginal effects for logit
logitmfx(logitmodel,atmean=TRUE,data=wage1)
logitmfx(logitmodel,atmean=FALSE,data=wage1)

#Run an ordered probit
orderedprobit <- polr(factor(educ)~female+northcen+south+west,data=wage1,Hess=TRUE,method="probit")

#Get marginal effects for our ordered probit
ocME(orderedprobit)
