
library(ggplot2)

givemeppsf <- function(price, size) {
  return(price / size)
}

thesizes <- c(1400, 2400, 1800, 1900, 1300, 1100)
theprices <- c(98000, 168000, 126000, 133000, 91000, 77000)
dfFirst <- data.frame(size = thesizes, price = theprices)
ggplot(dfFirst, aes(x=dfFirst$size, y=dfFirst$price)) +
  geom_point(shape=1) +
  geom_smooth(method=lm)
dfFirst$ppsf <- mapply(givemeppsf, dfFirst$price, dfFirst$size)
dfFirst

thesizes <- c(1700, 2100, 1900, 1300, 1600, 2200)
theprices <- c(51000, 63000, 57000, 39000, 48000, 66000)
dfSecond <- data.frame(size = thesizes, price = theprices)
ggplot(dfSecond, aes(x=dfSecond$size, y=dfSecond$price)) +
  geom_point(shape=1) +
  geom_smooth(method=lm)
dfSecond$ppsf <- mapply(givemeppsf, dfSecond$price, dfSecond$size)
dfSecond
