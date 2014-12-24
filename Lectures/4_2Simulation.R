# Simulations
# Generating Random numbers#
#  Functions for probability distributions in R:
#   rnorm: generate random Normal variates with a given mean and standard deviation
#   dnorm: evaluate the Normal probability density (with a given mean/SD) at a point
#         (or vector of points)
#   pnorm: evaluate the cumulative distribution function for a Normal distribution
#   rpois: generate random Poisson variates with a given rate

# Probability distribution functions usually have four functions associated
#   with them. The functions are prefixed with a
# -d for density
# -r for random number generation
# -p for cumulative distribution
# -q for quantile function

# Defaults is a normal dist. mean=0 SD=1
x <- rnorm(10)
x
x <- rnorm(10, 20, 2)  # mean 20, SD 2
x
summary(x)

set.seed(1) # Imporant! when testing
rnorm(5)
rnorm(5)
set.seed(1)     # Go back to the top
rnorm(5)

rpois(10, 1) # rate of 1
rpois(10, 2)
rpois(10, 20)
#Cumulative Dist -> allows you to find propabilities
ppois(2, 2)# Probability(x<=2)
ppois(4, 2)# Probability(x<=4)
ppois(6, 2)# Probability(x<=6)

# Suppose we want ot simulate from a linear model
set.seed(20)
x <- rnorm(100)         #predictor
e <- rnorm(100, 0, 2)   #random noise
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

# What about binary?
set.seed(10)
x <- rbinom(100, 1, 0.5)#predictor
e <- rnorm(100, 0, 2) #noise
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

# What about a generalized linear model?
set.seed(1)
x <- rnorm(100)  #predictor
log.mu <- 0.5 + 0.3 * x  #linear predictor
y <- rpois(100, exp(log.mu)) #simulate it 100 times
summary(y)
plot(x, y)

## SAMPLE
set.seed(1)
sample(1:10, 4) # params - data, how many samples
sample(1:10, 4)
sample(letters, 5)
sample(1:10)  ## a permutation
sample(1:10, replace = TRUE)  ## Sample w/replacement

#Summary
# Drawing samples from specific probability distributions can be done with r*
#  functions
# Standard distributions are built in: Normal, Poisson, Binomial, Exponential,
#  Gamma, etc.
# The sample function can be used to draw random samples from arbitrary vectors
# Setting the random number generator seed via set.seed is critical for
#  reproducibility

