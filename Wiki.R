setwd("C:/Users/hp/Desktop/Project - DWBI/R stuffs")
install.packages("tidyverse")
install.packages("lubridate")
library(rvest)
library(tidyverse)
library(stringr)
library(lubridate)

url <- "https://en.wikipedia.org/wiki/Economy_of_the_United_Kingdom"


readtable <- read_html(url) %>%
          html_nodes("#mw-content-text > div > table:nth-child(170)") %>%
          html_table(fill = TRUE) 

Wiki <- as.data.frame(readtable,stringsAsFactors = FALSE)

str(Wiki)
#Wiki$Year <- as.Date(paste(Wiki$Year, 1, 1, sep = "-"))
#Wiki$Year <- as.Date(year(Wiki$Year))
#Wiki$Year <- as.Date(Wiki$Year)
#str(Wiki)

Wiki$GDP.in.Bil..US..PPP. <- as.numeric(gsub(",","",Wiki$GDP.in.Bil..US..PPP.,fixed=TRUE))
Wiki$GDP.per.capita.in.US..PPP. <- as.numeric(gsub(",","",Wiki$GDP.per.capita.in.US..PPP.,fixed=TRUE))

Wiki$GDP.growth.real. <- gsub("%","",Wiki$GDP.growth.real.,fixed=TRUE)
Wiki$GDP.growth.real. <- substr(Wiki$GDP.growth.real.,0,nchar(Wiki$GDP.growth.real.)-1)

Wiki$Inflation.rate.in.Percent. <- gsub("%","",Wiki$Inflation.rate.in.Percent.,fixed=TRUE)
Wiki$Inflation.rate.in.Percent. <- substr(Wiki$Inflation.rate.in.Percent.,0,nchar(Wiki$Inflation.rate.in.Percent.)-1)
Wiki$Inflation.rate.in.Percent. <- as.numeric(Wiki$Inflation.rate.in.Percent.)

Wiki$Unemployment..in.Percent. <- gsub("%","",Wiki$Unemployment..in.Percent.,fixed=TRUE)
Wiki$Unemployment..in.Percent. <- substr(Wiki$Unemployment..in.Percent.,0,nchar(Wiki$Unemployment..in.Percent.)-1)
Wiki$Unemployment..in.Percent. <- as.numeric(Wiki$Unemployment..in.Percent.)

Wiki$Government.debt.in...of.GDP.   <- gsub("%","",Wiki$Government.debt.in...of.GDP.,fixed=TRUE)
Wiki$Government.debt.in...of.GDP. <- substr(Wiki$Government.debt.in...of.GDP.,0,nchar(Wiki$Government.debt.in...of.GDP.)-1)
Wiki$Government.debt.in...of.GDP. <- as.numeric(Wiki$Government.debt.in...of.GDP.)

Col <- colnames(Wiki)
View(Col)
Col <- gsub("."," ",Col)


Wiki$GDP.in.Bil..US..PPP. <- NULL
Wiki$GDP.per.capita.in.US..PPP. <- NULL
Wiki$GDP.growth.real. <- NULL
Wiki$Government.debt.in...of.GDP. <- NULL

colnames(Wiki) <- c("Year","Inflation rate in Percent","Unemployment in Percent")

lstyear <- data.frame("2018","1.8","3.9")
colnames(lstyear) <- c("Year","Inflation rate in Percent","Unemployment in Percent")

Wiki <- rbind(Wiki,lstyear)
  
View(Wiki)


str(Wiki)
write.csv(Wiki,file = "Wiki.csv",row.names = FALSE)
