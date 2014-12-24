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