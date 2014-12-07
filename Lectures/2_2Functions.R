# My first Function
# x is a 'formal' argument, n is not
above<- function(x, n=10){ # n's default is 10
    use<-x>n
    x[use]# This is the return
}

# Functions
# Functions are treated like an object, functions can be passed as arguments

# Argument Matching:
args(lm)
lm(data = mydata, y ~ x, model = FALSE, 1:100) # can move the variables around
lm(y ~ x, mydata, 1:100, model = FALSE)

# Lazy evaluation
# Arguments are evaluated ONLY when it is needed
f <- function(a, b) {
    print(a)
    print(b)
}
f(45) # Missing b value. Will print a then throw error

# '...'
# '...' is often used when extending another function and you don’t want to
# copy the entire argument list of the original function
myplot <- function(x, y, type = "l", ...) {
    plot(x, y, type = type, ...)
}

# Sometimes you never know how many variables are args
# ex: Pastes together all the strings
args(paste)

# Generic functions use '...' so that extra arguments can be passed to methods.
mean

