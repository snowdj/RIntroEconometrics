#libraries
library(AER)
library(tseries)
library(dynlm)
library(stargazer)
library(forecast)

#Create random data
gdpgrowth <- rnorm(100)

#Declare it as time series with ts()
gdpgrowth <- ts(gdpgrowth,start=c(1990,1),frequency=12)

#Plot our time series
plot(gdpgrowth)

#Bring in some China datad
data("ChinaIncome")

#Plot China data
plot(ChinaIncome)

#Pull out one of the time series
industry <- ChinaIncome[,5]
plot(industry)

#Autocorrelation plot
acf(industry)
#Partial autocorrelation function
pacf(industry)

#Dickey-Fuller test
adf.test(industry)

#Run a regression with a lag value
tsreg <- dynlm(industry~L(industry))
stargazer(tsreg,type='text')
tsreg2 <- dynlm(industry~L(industry,1:3))
stargazer(tsreg2,type='text')

#Tell R the seasonality of our time series
industry <- ts(industry,frequency=12)
seasons <- stl(industry,s.window="period")

#Plot out a seasonality plot for industry
seasonplot(industry)
