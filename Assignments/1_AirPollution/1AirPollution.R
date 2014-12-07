#P1
# Get the mean of 'pollutant' accross the files specified with 'id'
pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {
    allData <- vector(mode = "numeric")
    for (i in id){
        if (i<10)   #add zeros
            zero<-"00"
        else if(i<100)  #Add zeros
            zero<-"0"
        else
            zero<-""
        #read in 1 file
        data<-read.csv(paste(directory,"/",zero,i,".csv", sep=""),
                       comment.char = "", header = T)
        #add that data to allData
        allData<-c(allData,data[,pollutant])
    }
    #take mean get rid of na too
    mean(allData, na.rm=T)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

#P2
# find the number of complete observation (no NAs) per id
complete <- function(directory= "specdata", ids = 1:332) {
    id <- vector(mode = "integer")      #Get ids
    nobs <- vector(mode = "integer")    #Get nobs
    for (i in ids){
        id<-c(id,i)
        if (i<10)   #add zeros
            zero<-"00"
        else if(i<100)  #Add zeros
            zero<-"0"
        else
            zero<-""
        #read in 1 file
        data<-read.csv(paste(directory,"/",zero,i,".csv", sep=""),
                       comment.char = "", header = T)
        sulNAs <- is.na(data[,"sulfate"])
        nitNAs <- is.na(data[,"nitrate"])
        comNA  <- sulNAs | nitNAs
        nobs<-c(nobs,length(comNA[comNA== F]))
    }
    as.data.frame(cbind(ids, nobs))

}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

#P3
# Get correlations of each complete observation with a minimum threshold
corr <- function(directory = "specdata", threshold = 0) {
    cors<-vector(mode = "numeric")
    ids <- 1:332
    for (i in ids){
        if (i<10)   #add zeros
            zero<-"00"
        else if(i<100)  #Add zeros
            zero<-"0"
        else
            zero<-""
        #read in 1 file
        data<-read.csv(paste(directory,"/",zero,i,".csv", sep=""),
                       comment.char = "", header = T)
        sulNAs <- is.na(data[,"sulfate"])
        nitNAs <- is.na(data[,"nitrate"])
        comNA  <- sulNAs | nitNAs
        if (length(comNA[comNA== F])>threshold){
            cors<- c(cors,
                     cor(data[,"sulfate"][comNA==F],data[,"nitrate"][comNA==F]))
        }
    }
    cors
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)


