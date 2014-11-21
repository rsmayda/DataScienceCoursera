#Setting up
x <- c("a", "b", "c", "c", "d", "a")

#Subset indices start at 1
x[1]
x[2]
x[1:4] #Multiple

#logical subset
x[x>"a"]
u<-x>"a"  #Save logical subset
u
x[u]

#Matrix
m<-matrix(1:6,2,3)
m
m[1,2]
m[2,1]
m[1,] #get 1st row
m[,2] #get 2nd column

#by default subsetting matrices return a vector, to turn off behavior see below
m[1,2, drop= F]
m[1, ,drop= F]

# Subsetting Lists
l <- list (rank = 1:4, bar =0.6, baz="hello")
l[1]# Get foo
l[[1]]# Get just the sequence
l$bar#get element associated with 'bar'
l[["bar"]]#equivelant to top
l["bar"]

l[c(1,3)] # subset the 1st & 3rd element
l[[c(1,3)]] # two [[]] means get one element so this is getting the 3rd element within the 1st element
l[[1]][[3]] # Same as above

name <-"rank"
l[[name]] ### LOOK cool feature if you compute index use this!
l$name ## Won't work

l$rank
l$r ### Same as above; $ tries to find a match and 'rank' is the closest

## Removing Na's
nums <- c(1,2,NA, 4, NA, 5)
bad<-is.na(nums) # Creates locical list
nums[!bad] # Gets rid of the bad data

## More complex... Subset all missing element
t <- c(1,2,NA, 4, NA, 5)
i <- c("a", "b",NA, "d", "e", "f")
good<- complete.cases(t,i)
good
t[good]
i[good]