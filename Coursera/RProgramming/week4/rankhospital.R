setwd('/Users/jzeolla/Documents/MOOC/R\ Programming/week4/')

rankhospital <- function(state, outcome, num = "best") {
  possibleOutcomes <- c("heart attack","heart failure","pneumonia")
  
  ## Read outcome data
  thedata <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)
  
  ## Check that state and outcome are valid
  if (!(state %in% thedata$State)) {
    stop("invalid state")
  } else if (!(outcome %in% possibleOutcomes)) {
    stop("invalid outcome")
  }
  
  statematch <- thedata[thedata$State == state, ]
  
  if (num == "best") {
    numval <- as.numeric(1)
  } else if (num == "worst") {
    numval <- as.numeric(nrow(statematch))
  } else {
    numval <- as.numeric(num)
  }
  
  if (numval > as.numeric(nrow(statematch))) {
    return(NA)
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  if (outcome == "heart attack") {
    statematch_nona <- statematch[complete.cases(as.numeric(statematch[, 11])), ]
    if (num == "worst") {
      mortality <- max(as.numeric(statematch_nona[, 11]))
      selectthese <- as.logical(as.numeric(statematch_nona[, 11]) == as.numeric(mortality))
      relevantdata <- statematch_nona[selectthese, ]
    } else if (num == "best") {
      mortality <- min(as.numeric(statematch_nona[, 11]))
      selectthese <- as.logical(as.numeric(statematch_nona[, 11]) == as.numeric(mortality))
      relevantdata <- statematch_nona[selectthese, ]
    } else {
      reordered <- statematch_nona[order(statematch_nona[,2]),]
      selectthese <- as.logical(rank(as.numeric(reordered[, 11]), ties.method = "first") == numval)
      relevantdata <- reordered[selectthese, ]
    }
    
  } else if (outcome == "heart failure") {
    statematch_nona <- statematch[complete.cases(as.numeric(statematch[, 17])), ]
    if (num == "worst") {
      mortality <- max(as.numeric(statematch_nona[, 17]))
      selectthese <- as.logical(as.numeric(statematch_nona[, 17]) == as.numeric(mortality))
      relevantdata <- statematch_nona[selectthese, ]
    } else if (num == "best") {
      mortality <- min(as.numeric(statematch_nona[, 17]))
      selectthese <- as.logical(as.numeric(statematch_nona[, 17]) == as.numeric(mortality))
      relevantdata <- statematch_nona[selectthese, ]
    } else {
      reordered <- statematch_nona[order(statematch_nona[,2]),]
      selectthese <- as.logical(rank(as.numeric(reordered[, 17]), ties.method = "first") == numval)
      relevantdata <- reordered[selectthese, ]
    }
  } else if (outcome == "pneumonia") {
    statematch_nona <- statematch[complete.cases(as.numeric(statematch[, 23])), ]
    if (num == "worst") {
      mortality <- max(as.numeric(statematch_nona[, 23]))
      selectthese <- as.logical(as.numeric(statematch_nona[, 23]) == as.numeric(mortality))
      relevantdata <- statematch_nona[selectthese, ]
    } else if (num == "best") {
      mortality <- min(as.numeric(statematch_nona[, 23]))
      selectthese <- as.logical(as.numeric(statematch_nona[, 23]) == as.numeric(mortality))
      relevantdata <- statematch_nona[selectthese, ]
    } else {
      reordered <- statematch_nona[order(statematch_nona[,2]),]
      selectthese <- as.logical(rank(as.numeric(reordered[, 23]), ties.method = "first") == numval)
      relevantdata <- reordered[selectthese, ]
    }
  }
  
  return(as.character(relevantdata$Hospital.Name))
}
