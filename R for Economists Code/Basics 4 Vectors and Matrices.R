#Create a vector
a <- c(1,2,3)

#Find the second element of a
a[2]

#Change the second element of a to 4
a[2] <- 4

#Look at some elements of a
a[1:2]
a[c(1,2)]
a[c(TRUE,TRUE,FALSE)]
a[a<4]
a[c(2,2,2)]

#Second vector
b <- c(4,5,6)

#Create a matrix
x <- cbind(a,b)

#Look at parts of x
x[3,2]

#Get just the rows where a is less than 4
x[,1]  < 4
x[x[,1]  < 4,]
