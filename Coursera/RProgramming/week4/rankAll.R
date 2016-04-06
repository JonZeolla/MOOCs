setwd('/Users/jzeolla/Documents/MOOC/R\ Programming/week4/')

rankall <- function(outcome, num = "best") {
  possibleOutcomes <- c("heart attack","heart failure","pneumonia")
  
  ## Read outcome data
  thedata <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)
  
  ## Check that state and outcome are valid
  if (!(outcome %in% possibleOutcomes)) {
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  
  
  #hospital <- 
  #state <- 
  
  finalmatch <- data.frame(hospital, state)
  return(finalmatch)
}
