# Scoping
# When R tries to bind a value to a symbol, it searches through a series of
# environments to find the appropriate value. When you are working on the
# command line and need to retrieve the value of an R object, the order is roughly
#  1.Search the global environment for a symbol name matching the one requested.
#  2.Search the namespaces of each of the packages on the search list
# The search list can be found by using the search function.
search()

# So if you create a function called 'lm' it will be in .GlobalEnv... Instead of stats


#Scoping Rules
#  The scoping rules determine how a value is associated with a free variable in a function
#  R uses lexical scoping or static scoping. A common alternative is dynamic scoping.
#  Related to the scoping rules is how R uses the search list to bind a value to a symbol
#    It looks in current enviro; if not there->Look at parent enviro; etc until empty enviro

## Able to make function inside of a function and return it
make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}
# Create a cube/square function:
cube <- make.power(3)
square <- make.power(2)
cube(3)
# Look at the function
ls(environment(cube))
get("n", environment(cube))

# Lexical vs. Dynamic
y <- 10

f <- function(x) {
    y <- 2
    y^2 + g(x)
}

g <- function(x) {
    x*y
}
# What does the below return? in R y=10; in Java y=2
f(3)
# in R (Lexical):     34
# in Java (dynamic):  10

f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}

z <- 10
f(3)
 # 10, because z is defined where the function was defined

#Lexical Scoping Summary
# Objective functions can be “built” which contain all of the necessary data for
#   evaluating the function
# No need to carry around long argument lists — useful for interactive and
#   exploratory work.
# Code can be simplified and cleand up
# Lexical is good for optimization