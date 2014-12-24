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