#libraries
library(AER)
library(forecast)

#Bring in China data and get industry time series from it
data(ChinaIncome)
industry <- ChinaIncome[,5]

plot(industry)

#Run an ARIMA
arimamodel <- arima(industry,order=c(1,1,1))
summary(arimamodel)

#Forecast five periods into the future
forecast(arimamodel,5)
#plot that forecast
plot(forecast(arimamodel,5))
