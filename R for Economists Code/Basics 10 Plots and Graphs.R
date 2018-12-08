#Load packages
library(foreign)

#Read in Wooldridge data
wage1 <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/wage1.dta")

#Plot looking at relationship of wage and education
plot(wage1$educ,wage1$wage,xlab="Education",
     ylab="Wage",main="Relationship of Wage and Education")
abline(mean(wage1$wage),0)

#Histogram
hist(wage1$educ)
#Density plot
plot(density(wage1$educ))

#Barplots
table(wage1$educ)
barplot(table(wage1$educ))
barplot(table(wage1$married))

#Stacked bar plot
barplot(table(wage1$married,wage1$smsa))

#Line graph
plot(aggregate(wage~educ,data=wage1,FUN=mean),type="l")

#BONUS: a line graph with data that's already in line graph format
time <- 1975:2000
#'rnorm' creates random normal data that we're adding on 
#length() checks the number of elements of time to make sure they
#are the same length
gdpgrowth <- rnorm(length(time))
#cbind to stick them together
gdpovertime <- as.data.frame(cbind(time,gdpgrowth))
plot(gdpovertime$time,gdpovertime$gdpgrowth,type="l")
