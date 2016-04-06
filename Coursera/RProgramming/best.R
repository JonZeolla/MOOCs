setwd('/Users/jzeolla/Documents/MOOC/R\ Programming/week4/')

best <- function(state, outcome) {
  possibleOutcomes <- c("heart attack","heart failure","pneumonia")
  
  ## Read outcome data
  thedata <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)
  
  ## Check that state and outcome are valid
  if (!(state %in% thedata$State)) {
    stop("invalid state")
  } else if (!(outcome %in% possibleOutcomes)) {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  statematch <- thedata[thedata$State == state, ]
  
  if (outcome == "heart attack") {
    statematch_nona <- statematch[complete.cases(as.numeric(statematch[, 11])), ]
    lowestmortality <- min(as.numeric(statematch_nona[, 11]))
    selectthese <- as.logical(as.numeric(statematch_nona[, 11]) == as.numeric(lowestmortality))
    relevantdata <- statematch_nona[selectthese, ]
  } else if (outcome == "heart failure") {
    statematch_nona <- statematch[complete.cases(as.numeric(statematch[, 17])), ]
    lowestmortality <- min(as.numeric(statematch_nona[, 17]))
    selectthese <- as.logical(as.numeric(statematch_nona[, 17]) == as.numeric(lowestmortality))
    relevantdata <- statematch_nona[selectthese, ]
  } else if (outcome == "pneumonia") {
    statematch_nona <- statematch[complete.cases(as.numeric(statematch[, 23])), ]
    lowestmortality <- min(as.numeric(statematch_nona[, 23]))
    selectthese <- as.logical(as.numeric(statematch_nona[, 23]) == as.numeric(lowestmortality))
    relevantdata <- statematch_nona[selectthese, ]
  }
  
  # Alphabetically order, and take the top onebest("TX", "heart attack")
  finalmatch <- factor(head(sort(relevantdata$Hospital.Name), 1))
  return(as.character(finalmatch))
}