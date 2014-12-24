# Profiling R
# Why is my code running slow?
# -Profiling is a systematic way to examine how much time is spend in different
#   parts of a program
# -Useful when trying to optimize your code
# -Often code runs fine once, but what if you have to put it in a loop for 1,000
#   iterations? Is it still fast enough?
# -Profiling is better than guessing


# Optimizing shouldn't be your #1
        # Design first, then optimize
        # Measure (collect data), don’t guess.

system.time(mean(1:10000))
# Takes an arbitrary R expression as input (can be wrapped in curly braces) and
#   returns the amount of time taken to evaluate the expression
# Computes the time (in seconds) needed to execute an expression
# -If there’s an error, gives time until the error occurred
# Returns an object of class proc_time
# -user time: time charged to the CPU(s) for this expression
# -elapsed time: "wall clock" time

# Normally times are similar
#Elapsed time may be greater than user time if the CPU spends a lot of time
#  waiting around
#Elapsed time may be smaller than the user time if your machine has multiple
#  cores/processors (and is capable of using them)

system.time(readLines("http://www.jhsph.edu"))
# high elapsed since you have to wait for network

hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x))

system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})

##R Profiler
# The Rprof() function starts the profiler in R
#   -R must be compiled with profiler support (but this is usually the case)
# The summaryRprof() function summarizes the output from Rprof() (otherwise it’s
#   not readable)
# DO NOT use system.time() and Rprof() together or you will be sad

# Rprof() keeps track of the function call stack at regularly sampled intervals and
#    tabulates how much time is spend in each function
# Default sampling interval is 0.02 seconds
# NOTE: If your code runs very quickly, the profiler is not useful, but then you
#    probably don't need it in that case


##Using summaryRprof()
# The summaryRprof() function tabulates the R profiler output and calculates how
#     much time is spend in which function
# "by.total" divides the time spend in each function by the total run time
# "by.self" does the same but first subtracts out time spent in functions above
#     in the call stack (BEST format)

Rprof()
svd(x)
summaryRprof()
$sample.interval
$sampling.time



## Summary
# -Rprof() runs the profiler for performance of analysis of R code
# -summaryRprof() summarizes the output of Rprof() and gives percent of time spent
#     in each function (with two types of normalization)
# -Good to break your code into functions so that the profiler can give useful
#     information about where time is being spent

