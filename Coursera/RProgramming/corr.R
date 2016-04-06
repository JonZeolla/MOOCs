setwd("/Users/jzeolla/Documents/MOOC/R Programming/week1")

corr <- function(directory, threshold = 0) {
  files <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  tables <- lapply(files, read.csv, header = TRUE)
  relevantlist <- do.call(rbind, tables)
  completerelevantlist <- relevantlist[complete.cases(relevantlist), ]
  id <- 1:length(files)
  correlation <- numeric()
  for (value in id) {
    if ( sum(completerelevantlist$ID == value) > threshold ) {
      thisiteration <- completerelevantlist[completerelevantlist$ID == value, ]
      sulfatevalues <- as.numeric(thisiteration$sulfate)
      nitratevalues <- as.numeric(thisiteration$nitrate)
      correlation[value] <- as.vector(cor(sulfatevalues, nitratevalues))
    }
  }
  correlation[!is.na(correlation)]
}