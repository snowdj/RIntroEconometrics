#load in packages
library(stargazer)

#Read in data
scorecard <- read.csv('Most+Recent+Cohorts+(Scorecard+Elements).csv',
                      stringsAsFactors=FALSE)

#Turn data into numeric, which gives us some missing values
scorecard$SAT_AVG <- as.numeric(scorecard$SAT_AVG)
scorecard$UGDS <- as.numeric(scorecard$UGDS)

#Run regression
SATonUGDS <- lm(SAT_AVG~UGDS,data=scorecard)
summary(SATonUGDS)

#Take a mean
mean(scorecard$SAT_AVG,na.rm=TRUE)
#Often these
#na.rm=TRUE
#na.omit =TRUE

#Figure out how many observations missing of each variable
stargazer(subset(scorecard,select=c("SAT_AVG","UGDS")),type='text')

#Create a nonmissing data set
nonmiss.scorecard <- subset(scorecard,!is.na(SAT_AVG))

#Create a data set with NO missing observations
NOTHINGmissing.scorecard <- subset(scorecard,complete.cases(scorecard))
#No missing observations WITHIN the variables I'm using
NOTHINGmissing.scorecard <- subset(scorecard,complete.cases(scorecard),select=c("SAT_AVG","UGDS"))
