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
