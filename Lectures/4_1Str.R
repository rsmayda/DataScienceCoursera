# str
# compactly display the stucture of an object
#  Similar to Summary
# answers: What is in this object
x<-1:10
x
str(x)
summary(x)


factor<- gl(40,10)
str(factor)
summary(factor)

library(datasets)
str(airquality)
summary(airquality)


s<-split(airquality,airquality$Month)
str(s)
summary(s)
