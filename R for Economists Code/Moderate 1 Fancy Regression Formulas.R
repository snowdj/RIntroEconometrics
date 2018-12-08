#Load packages
library(foreign)
library(stargazer)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Basic model
model3 <- lm(wage~educ+tenure+female+married,data=wage1)
stargazer(model3,type='text')

#Include a squared term
model4 <- lm(wage~educ+I(educ^2)+tenure+female+married,data=wage1)
stargazer(model4,type='text')

#Variables and their interactions
# y = alpha + beta1*educ + beta2*female + beta3*educ*female
model5 <- lm(wage~educ*female+tenure+married,data=wage1)
stargazer(model5,type='text')
#Just hte interaction term
model6 <- lm(wage~educ:female+tenure+married,data=wage1)
stargazer(model6,type='text')

#Use log wage instead of wage
model7 <- lm(log(wage)~educ+tenure+female+married,data=wage1)
stargazer(model7,type='text')

#A set of dummies for education
model8 <- lm(wage~factor(educ)+tenure+female+married,data=wage1)
stargazer(model8,type='text')

#Regression model with lots of control variables
regdata <- subset(wage1,select=c("wage","educ","exper","tenure","nonwhite","female","married","numdep"))
model9 <- lm(wage~.,data=regdata)
stargazer(model9,type='text')
regdata <- wage1[,1:8]
model9 <- lm(wage~.,data=regdata)
stargazer(model9,type='text')
#With an interaction
model10 <- lm(wage~educ*female+.,data=regdata)
stargazer(model10,type='text')
