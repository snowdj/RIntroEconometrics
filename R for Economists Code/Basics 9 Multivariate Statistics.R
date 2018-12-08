#Load packages
library(foreign)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Calculate a correlation
cor(wage1$wage,wage1$educ)
cor.test(wage1$wage,wage1$educ)

#Calculate a cross-tabulation
table(wage1$married,wage1$smsa)
#Labels on these axes
table(wage1$married,wage1$smsa,dnn=c("Married","SMSA"))

#check difference of means between two variables
t.test(wage1$exper-wage1$tenure)

#Get average wage by marital status
aggregate(wage~married,data=wage1,FUN=mean)
#and SMSA
aggregate(wage~married+smsa,data=wage1,FUN=mean)
