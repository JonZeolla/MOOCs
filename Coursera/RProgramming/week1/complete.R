setwd("/Users/jzeolla/Documents/MOOC/R Programming/week1")

complete <- function(directory, id = 1:332) {
  files <- sprintf("%s/%03d.csv", directory, id)
  tables <- lapply(files, read.csv, header = TRUE)
  relevantlist <- do.call(rbind, tables)
  completerelevantlist <- relevantlist[complete.cases(relevantlist), ]
  colid <- colnobs <- numeric()
  idx <- 1
  for (value in id) {
    colid[idx] <- value
    colnobs[idx] <- sum(completerelevantlist$ID == value)
    
    idx <- idx + 1
  }
  totals <- data.frame(colid, colnobs)
  names(totals) <- c("id","nobs")
  totals
}
