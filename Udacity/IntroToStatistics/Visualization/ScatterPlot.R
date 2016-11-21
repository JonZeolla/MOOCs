
library(ggplot2)
thesizes <- c(1400, 2400, 1800, 1900, 1300, 1100)
theprices <- c(98000, 168000, 126000, 133000, 91000, 77000)
df <- data.frame(size = thesizes, price = theprices)
ggplot(df, aes(x=df$size, y=df$price)) +
 geom_point(shape=1) +
 geom_smooth(method=lm)
