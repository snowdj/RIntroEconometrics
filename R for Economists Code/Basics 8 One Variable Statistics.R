#Load packages
library(foreign)
library(stargazer)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Take mean wage
mean(wage1$wage)

#Standard deviation of wage
sd(wage1$wage)

#Summary statistics table
summary(wage1$wage)
stargazer(subset(wage1,select=c(wage)),type='text')
stargazer(subset(wage1,select=c(wage,exper,tenure)),type='text')
stargazer(subset(wage1,female==1,select=c(wage)),type='html',out="womenstats.html")

#Look at the levels of education
table(wage1$educ)

#t-test checking the mean of a variable
t.test(wage1$wage-6)
