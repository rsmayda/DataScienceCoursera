# Control Structures
# Used for Functions
# 'ifs'
y <- if(x > 3) {
    10
} else {
    0
}

# 'for'
x <- c("a", "b", "c", "d")

for(i in 1:4) {
    print(x[i])
}

for(i in seq_along(x)) { # seq_along creates a numeric vector that represents 'x'
    print(x[i])
}

for(letter in x) {
    print(letter)
}

x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) { # seq_len() takes an integer and creates a vector of that length
    for(j in seq_len(ncol(x))) {
        print(x[i, j])
    }
}

# 'while'
z <- 5
while(z >= 3 && z <= 10) {
    print(z)
    coin <- rbinom(1, 1, 0.5)

    if(coin == 1) {  ## random walk
        z <- z + 1
    } else {
        z <- z - 1
    }
}

# 'repeat' -- infinite loop, Good for optimization
x0 <- 1
tol <- 1e-8

repeat {
    x1 <- computeEstimate()

    if(abs(x1 - x0) < tol) {
        break ### THIS is how you break
    } else {
        x0 <- x1
    }
}

# 'next'
for(i in 1:100) {
    if(i <= 20) {
        ## Skip the first 20 iterations
        next
    }
    print(i)
}

# Control structures mentiond here are primarily useful for writing programs;
#  for command-line interactive work, the *apply functions are more useful.
