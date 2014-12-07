# Dates and Time
# Dates are represented by the Date class
# Times are represented by the POSIXct or the POSIXlt class
# Dates are stored internally as the number of days since 1970-01-01
# Tmes are stored internally as the number of seconds since 1970-01-01

# Dates
x<- as.Date("1970-01-01")
x
unclass(x) # days since 1970-01-01
unclass(as.Date("1970-01-02"))

# Times
# POSIX is a time standard
# POSIXct - large int; usesful when you want to store time in a dataframe
# POSIXlt - list underneath and it stores useful information like:
#   Weekdays; Months; Quarters
x <- Sys.time()
x # already POSIXct
unclass(x) # seconds since 1970-01-01
# get more info with POSIXlt
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

# strptime create dates from times
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)
?strptime # helpful details

# DateTime will take care of weirdness
x <- as.Date("2012-03-01") y <- as.Date("2012-02-28")  # leap year
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT") # diff time zone
y-x

