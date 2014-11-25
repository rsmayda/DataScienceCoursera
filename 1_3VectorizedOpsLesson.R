# Feature is in MATLAB too
# Things ahppen in parrell
#Vector Math
x<-1:4
y<-6:9
# add the x[1]+y[1] ... loop
x+y
x*y
x/y
x-y
#logical op
x>2
x>=2
x==2
# Matrices Math
x<- matrix(1:4,2,2)
y<-matrix (5:8,2,2) #replicate 10 4times
#element-wise
x*y
x/y
#True Matrix mult
x %*% y
# Matrix math row * column (each element) then add together
# RULE the # of rows in x MUST = # of columns in y
# example: X # Row= 2; Y# Columns = 2 :)
#X: 1 3 * Y:  5  7
#   2 4       6  8
#RESULT:
# [1*5 + 3*6][1*7 + 3*8] ===  23  31
# [2*5 + 4*6][2*7 + 4*8]      34  46
