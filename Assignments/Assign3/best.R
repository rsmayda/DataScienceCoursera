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