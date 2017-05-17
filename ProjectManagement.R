## Header
  #Project Management Module
  #Troy J. Kieran
  #kierant@uga.edu
  #17 May 2017
  #Changelog


## Load packages 
library(ggplot2) 
library(lubridate)

## Declare Functions


## Load Data
mers <- read.csv("cases.csv")


## Analysis

#correct errors in data
mers$hospitalized[890] <- c("2015-02-20")
mers <- mers[-471,]


mers$onset2 <- ymd(mers$onset)
mers$hospitalized2 <- ymd(mers$hospitalized)
class(mers$onset2)

# na.omit removes NAs from data set
day0 <- min(na.omit(mers$onset2)) 

# as.numeric changes data class to numeric
mers$epi.day <- as.numeric(mers$onset2 - day0) 



g <- ggplot(data=mers) + geom_bar(mapping=aes(x=epi.day)) +
  labs(x='Epidemic day', y='Case count', title='Global count of MERS cases by date of symptom onset', caption="Data from: https://github.com/rambaut/MERS-Cases/blob/gh-pages/data/cases.csv")

g
