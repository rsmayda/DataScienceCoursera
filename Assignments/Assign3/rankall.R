#4 Ranking hospitals in all states
options(warn=-1)
rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv")
        df<- data.frame(hosName = data[,2],stateAb=data[,7],out = getDataPoint(outcome, data))
        # Drop levels
        df$stateAb<-as.character(df$stateAb)
        df$hosName<-as.character(df$hosName)
        df$out<-as.character(df$out)
        df$out<-as.numeric(df$out)
        df<-df[complete.cases(df$out),] # Get rid of NAs

        # Get sorted state abrevs
        states<-sort(unique(df$stateAb))
        # Set up return
        finalDf<- data.frame(hospital=rep(as.numeric(NA),54),state=as.character(NA),
                             stringsAsFactors = FALSE, row.names = states)
        # Adjust 'num'
        numRes<-1
        if (num!='best')
                numRes<-num
        ## For each state, find the hospital of the given rank
        i<-1
        for (s in states){
                # Subset Data
                tempDf<- subset(df, stateAb == s)

                #Sort data
                tempDf<- tempDf[order(tempDf$out, tempDf$hosName),]

                #Store Data
                if (num=='worst'){
                        numRes<-length(tempDf$out)
                }
                finalDf[i,1]<-tempDf[numRes,1]
                finalDf[i,2]<-s
                i<-i+1
        }

        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        finalDf
}


#Helpers
getDataPoint <- function(outcome, data) {
        if (outcome == 'heart attack')
                data[,11]
        else if (outcome =='heart failure')
                data[,17]
        else if (outcome =='pneumonia')
                data[,23]
        else
                stop('invalid outcome')
}