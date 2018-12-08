#Turn x into a data frame
x <- as.data.frame(x)

x[,1]<4
x[x[,1]<4,]

x$a < 4

#second element of a
x$a[2]

#create new variable
x$c <- c("Hello","Goodbye","Farewell")

#give me back farewell
x$c[3]

#Look at first row of data
x[1,]

#look at top of data
head(x)

#Bring in new data
#NOTE: I changed this dataset a bit after the video so you won't
#get the exact same results I did.
actdata <- read.csv('AccountingData.csv')

#Look at the third row of the DIV variable
actdata$DIV[3]

#Show me ATB
actdata[actdata$Firm=="ATB",]

#head of data
head(actdata)

#change the name of variables
names(actdata)[5] <- "Dividends"
names(actdata)

#Look at the third row of the DIV variable
actdata$Dividends[3]
