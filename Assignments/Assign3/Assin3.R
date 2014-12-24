# Assignment3
# Set-Up
outcome <- read.csv("outcome-of-care-measures.csv")
#1 Plot the 30-day mortality rates for heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
str(outcome)
heartAttack<-outcome[, 11]
plot(heartAttack)

#2 Finding the best hospital in a state

# Get the best hospital in specified state
# state- two chars ('OH','NC')
# outcome- measurement
options(warn=-1)
best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv")
        ## Check that state and outcome are valid
        if (!(state %in% data[,7]))
                stop('invalid state')
        df<- data.frame(out = getDataPoint(outcome, data),hosName = data[,2],stateAb=data[,7])
        # Subset Data
        df<- subset(df, stateAb == state)
        # Drop levels
        df$stateAb<-as.character(df$stateAb)
        df$hosName<-as.character(df$hosName)
        df$out<-as.character(df$out)

        df$out<-as.numeric(df$out)
        ## Return hospital name in that state with lowest 30-day death rate
        final<-df$hosName[min(df$out, na.rm = T) == df$out]
        min(final[!is.na(final)])
}

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")


#3 Ranking hospitals by outcome in a state

#Get a the 'num'th ranking by state & outcome
# state- two chars ('OH','NC')
# outcome- measurement
# num- ranking (th)
options(warn=-1)
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv")
        ## Check that state and outcome are valid
        if (!(state %in% data[,7]))
                stop('invalid state')

        df<- data.frame(hosName = data[,2],stateAb=data[,7],out = getDataPoint(outcome, data))
        # Subset Data
        df<- subset(df, stateAb == state)
        # Drop levels
        df$stateAb<-as.character(df$stateAb)
        df$hosName<-as.character(df$hosName)
        df$out<-as.character(df$out)
        df$out<-as.numeric(df$out)

        #Get rid of NAs
        df<-df[complete.cases(df),]

        #Sort data
        df<- df[order(df$out, df$hosName),]

        if (num=='best'){
                num<-1
        }else if(num == 'worst'){
                num<-length(df$out)
        }
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        df[num,'hosName']
}

rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


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

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
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


