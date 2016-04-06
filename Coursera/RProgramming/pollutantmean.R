setwd("/Users/jzeolla/Documents/MOOC/R Programming/week1")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- sprintf("%s/%03d.csv", directory, id)
  tables <- lapply(files, read.csv, header = TRUE)
  relevantlist <- do.call(rbind, tables)
  base::mean(relevantlist[[pollutant]], na.rm=TRUE)
}