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