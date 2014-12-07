# Loop Functions:
# all use anonymous functions
#  lapply: Loop over a list and evaluate a function on each element
#  sapply: Same as lapply but try to simplify the result
#  apply: Apply a function over the margins of an array
#  tapply: Apply a function over subsets of a vector
#  mapply: Multivariate version of lapply

# An auxiliary function split is also useful, particularly in conjunction with lapply.
# splits objects into sub-pieces


# LAPPLY -- always returns a list
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean) # loop over the list x and take the mean on each
sapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
sapply(x, mean)

x <- 1:4
lapply(x, runif, min=0, max=10) # min & max for the runif funct
sapply(x, runif, min=0, max= 10)

# anonymous functions
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
#Get the 1st column from the list
lapply(x, function(elt) elt[,1]) #<- anon funct
sapply(x, function(elt) elt[,1])
# SAPPLY -- simplified results of lapply
#See above for example

# APPLY - used to a evaluate a function (often an anonymous one) over the margins of an array.
#It is most often used to apply a function to the rows or columns of a matrix
#It can be used with general arrays, e.g. taking the average of an array of matrices
#It is not really faster than writing a loop, but it works in one line!
x <- matrix(rnorm(200), 20, 10)
x
dim(x)
apply(x, 2, mean) # Calculate mean of each column #2 is the second dim in x
apply(x, 1, mean) # Calculate mean of each row #1 is the first dim in x

# Optimized operations:
# rowSums = apply(x, 1, sum)
# rowMeans = apply(x, 1, mean)
# colSums = apply(x, 2, sum)
# colMeans = apply(x, 2, mean)

# calc 25% tile & 75% tile per row
apply(x, 1, quantile, probs = c(0.25, 0.75)) # probs is arg for quantile

# What is the average of a bunch of 2x2 array
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
a
dim(a)
apply(a, c(1, 2), mean) # keep the 1st & 2nd dim and average over the 3rd

# MAPPLY --multivariate apply which applies a function in parallel over a set of arguments.
# Use for functs that take multiple list args
# repeat 1 4 times 2 3 times etc
mapply(rep, 1:4, 4:1)

# you can vectorize a function

# TAPPLY - used to apply a function over subsets of a vector
x <- c(rnorm(10), runif(10), rnorm(10, 1))
fact <- gl(3, 10) # levels function repeat 3 levels 10 times
x
f
tapply(x, f, mean)
tapply(x, f, range) # get min &max

# SPLIT -- takes a vector or other objects and splits it into groups determined
# by a factor or list of factors-- COMMON to use with lapply
split(x, f)
lapply(split(x, f), mean)

library(datasets)
head(airquality)

# get the averages per month
s <- split(airquality, airquality$Month)
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
