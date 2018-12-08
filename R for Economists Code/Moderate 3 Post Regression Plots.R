#Load packages
library(foreign)
library(stargazer)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Basic model
model3 <- lm(wage~educ+tenure+female+married,data=wage1)
stargazer(model3,type='text')

#Get predicted values and residuals
predictedvalues <- predict(model3)
res <- residuals(model3)

#Check if mean of residuals is 0
mean(res)

#Check for heteroskedasticity by looking at variance
#of the residual against educ
plot(wage1$educ,res,xlab="Education",
     ylab="Residuals",main="Checking for Heteroskedasticity")
abline(0,0)

#Plot fitted values
plot(wage1$educ,predictedvalues,xlab="Education",ylab="Predictions",main="Graph of Fitted Values")

#Plot the regression line on top of the scatterplot
plot(wage1$educ,wage1$wage,xlab="Education",
     ylab="Wage",main="Relationship Between Education and Wages")
abline(model3)
