#Load packages
library(tidyverse)

#Create data sets
a <- data.frame(person = 1:5,
                ur1 = runif(5),
                ur2 = runif(5),
                ur3 = runif(5),
                ur4 = runif(5))
b <- tibble(month = 1:4,
            gdpgrowth = rnorm(4))

#I want a to be a tibble
a <- as.tibble(a)

#Gather a into long format data
a <- gather(a,"mo","UR",ur1:ur4)
a <- gather(a,"mo","UR",starts_with("ur"))

#Use substr to pull out the month number
a$month <- substr(a$mo,3,3)
a$month <- as.numeric(a$month)

#Always read the join documentation
help(join)

#Join/merge our data sets together
joineddata <- full_join(a,b)

#Get correlation
cor(joineddata$UR,joineddata$gdpgrowth)
