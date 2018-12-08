#Load packages
library(foreign)
library(stargazer)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Created a regression object
model1 <- lm(wage~educ,data=wage1)
model2 <- lm(wage~tenure,data=wage1)

#Summary of the model
summary(model1)
#Nicer table with stargazer
stargazer(model1,type='text')
#Feed out the table to a file
stargazer(model1,type='html',out="model1.html")
#Multiple models at once
stargazer(model1,model2,type='html',out="model1.html")

#Regress on multiple variables at once
model3 <- lm(wage~educ+tenure+female+married,data=wage1)
stargazer(model3,type='text')

#Same model but without a constnat
model4 <- lm(wage~-1+educ+tenure+female+married,data=wage1)
stargazer(model4,type='text')
