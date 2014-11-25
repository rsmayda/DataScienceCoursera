# Reading and writing in R
## READING
# read.table, read.cvs (MOST COMMON) read in .txt files
# readLines reading lines of a txt file (reads any types of files)
# source reading in R code files (inverse 'dump')
# dget read in R objects (inverse 'dput')
# load reading in saved workspaces
# unserialize read in binary objs in R
## WRITING
# write.table
# writeLines
# dump
# dput
# save
# serialize

# The  read.table  function arguments: RETURNS a DataFrame
# •  file , the name of a file, or a connection
# •  header , logical indicating if the file has a header line
# •  sep , a string indicating how the columns are separated
# •  colClasses , a character vector indicating the class of each column in the dataset
# •  nrows , the number of rows in the dataset
# •  comment.char , a character string indicating the comment character DEFAULT = #
# •  skip , the number of lines to skip from the beginning
# •  stringsAsFactors , should character variables be coded as factors? DEFAULT =T

data<-read.table("SampleData.txt", T, ',', stringsAsFactors= F, comment.char = "")
data
data$Name


## Reading in Larger Datasets with read.table
# Do the following:
# •Read the help page for read.table, which contains many hints
# •Make a rough calculation of the memory required to store your dataset. If the dataset is larger
#   than the amount of RAM on your computer, you can probably stop right here.
# •Set  comment.char = ""  if there are no commented lines in your file.
# •Use the  colClasses  argument. Specifying this option instead of using the default can make
#   ’read.table’ run MUCH faster, often twice as fast. In order to use this option, you have to
#   know the class of each column in your data frame. If all of the columns are “numeric”, for example,
#   then you can just set  colClasses = "numeric".
#   A quick an dirty way to figure out the classes of each column is the following:
#     initial <- read.table("datatable.txt", nrows = 100)
#     classes <- sapply(initial, class)
#     tabAll <- read.table("datatable.txt",
#                      colClasses = classes)

# Questions to ask:
# •How much memory is available?
# •What other applications are in use?
# •Are there other users logged into the same system?
# •What operating system?
# •Is the OS 32 or 64 bit?

# I have a data frame with 1,500,000 rows and 120 columns, all of which are numeric data.
# 1,500,000 × 120 × 8 bytes/numeric
# = 1440000000 bytes
# = 1440000000 / 2^{20} bytes/MB
# = 1,373.29 MB
# = 1.34 GB

## Writing example
# •Unlike  writing out to a table or csv file,  'dump'  and  'dput'  preserve the metadata,
#   so that another user doesn’t have to specify it all over again.
# •Downside: The format is not very space-efficient

#dput
y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "WritingTest.R") #Create file
new.y <- dget("WritingTest.R")  #Read it in
new.y

#dump
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "WritingTest.R")  #Create file
rm(x, y)
source("WritingTest.R")                    #Read it in
y
x

#Interface with the outside
str(file)
# •  description  is the name of the file
# •  open  is a code indicating ◦“r” read only
#   ◦“w” writing (and initializing a new file)
#   ◦“a” appending
#   ◦“rb”, “wb”, “ab” reading, writing, or appending in binary mode (Windows)

# URL readLines  can be useful for reading in lines of webpages
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)
close(con)
