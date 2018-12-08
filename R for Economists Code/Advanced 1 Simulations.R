
#Create a blank data set to store our results in
results <- data.frame(xcoef = NA,
                      xse = NA)

#Loop! Do the code in the brackets once with i = 1, 
#once with i = 2, etc... up to once with i = 5000
for (i in 1:5000) {
  
  #Create our "true" data and model
  error1 <- rnorm(5000)
  x = error1 + rnorm(5000)
  y = 1.5*x + error1 + rnorm(5000)
  
  #Apply our estimator
  olsmodel <- lm(y~x)
  
  #store the results
  results[i,] <- c(coef(olsmodel)[['x']],
                   summary(olsmodel)$coefficients[2,2])
}

#See how bad our estimator performs with our broken assumption.
#The TRUE coefficient is 1.5... how far away are we?
plot(density(results$xcoef))
