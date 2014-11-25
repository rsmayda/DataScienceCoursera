## Mixing obj types (Log & Num) Will force to num
concat<-c(T,T,0,1,6,7)
concat
 
## Can force obj type
as.logical(concat)
 
## DF with column names
race<-data.frame(Rank= 1:4, Passed= c(T,T,F,F))
race
 
## List with column names 
raceNum<-1:4
raceNum
names(raceNum)<-c("Bob","Rob","Joe", "Jon")
raceNum
 
## Matrix with Row & column names
m<-matrix(1:4, nrow=2, ncol=2)
m
dimnames(m)<-list(c("a","b"), c("c","d"))
m
attributes(m)

## Change matrix size
dim(m)<-c(1,4)
m
attributes(m)

## Diff in c & r bind
a<-1:3
b<-10:12
cbind(a,b)
rbind(a,b)

## NA & NaN are different!
l<-c(NA,NaN)
l
is.na(l)
is.nan(l)
