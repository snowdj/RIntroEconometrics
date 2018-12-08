# Limited Dependent Variable Models in R (Tobit, Truncated Regression)
# Copyright 2013 by Ani Katchova

# install.packages("VGAM")
library(VGAM)
# install.packages("AER")
library(AER)
# install.packages("truncreg")
library(truncreg)
# install.packages("censReg")
library(censReg)

mydata<- read.csv("C:/Econometrics/Data/limdep_ambexp.csv")
attach(mydata)

# Define variables
Y <- cbind(ambexp)
X <- cbind(age, female, totchr)

# Descriptive statistics
summary(Y)
summary(X)

# Tobit model coefficients (sensoring from below at 0)
tobit1 <- tobit(Y ~ X, left=0, right=Inf, data=mydata)
summary(tobit1)

tobit2 <- censReg(Y ~ X, left=0, right=Inf, data=mydata)
summary(tobit2)

# Tobit model marginal effects for the censored sample
summary(margEff(tobit2))

# Probit model coefficients
probit1 <- glm(I(Y > 0) ~ X, data = mydata, family = binomial(link = "probit"))
summary(probit1)

# Truncated regression coefficients
mydata.truncated <- subset(mydata, Y>0)
truncreg1 <- truncreg(Y ~ X, point = 0, direction = "left", data=mydata.truncated)
summary(truncreg1)

# Test for Tobit versus Probit and Truncated regression
lrtest <- 2*(logLik(probit1) + logLik(truncreg1) - logLik(tobit1))
lrtest
