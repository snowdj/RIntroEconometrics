#Bring in new data
actdata <- read.csv('AccountingData.csv')

#Create a new variable
actdata$NewYear <- actdata$Year + 1

#Turn Firm into a character variable
actdata$Firm <- as.character(actdata$Firm)

#get just ATB
actdata[actdata$Firm == "ATB",]

#Get just ATB again, but with subset
subset(actdata,Firm == "ATB")
#Just ATB and recent years after 2011
subset(actdata,Firm == "ATB" & Year > 2011)

#Just ATB, but only the columns that aren't MV
subset(actdata,Firm=="ATB",select=c(Year,Firm,BV,DIV,EPS,NewYear))
subset(actdata,Firm=="ATB",select=-c(MV))

#store the ATB data by itself
ATBdata <- subset(actdata,Firm=="ATB",select=-c(MV))
#get rid of MV in the main data and make it stick
actdata <- subset(actdata,select=-c(MV))

#New variable equal to 1
actdata$one <- 1
