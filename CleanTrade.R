install.packages("openxlsx")
install.packages("tidyverse")

setwd("C:/Users/hp/Desktop/Project - DWBI/R stuffs")
library("openxlsx")
library(tidyverse)
library(dplyr)

my_data <- read.xlsx("cpapublicationq42018.xlsx",sheet = "1 Exports",startRow = 4,colNames = TRUE,rowNames = TRUE,detectDates = TRUE)
#str(my_data)
View(my_data)
#class(my_data)

Ctgry <- c(1,2,13,26,161,165,171,178,183,188)
Yrs <- c(1:22)


MinData <- my_data[Ctgry,Yrs]
View(MinData)

Colname <- names(MinData[,2:22])
#View(Colname)
#write.csv(MinData,"MinData.csv")

firstrowname <- "Total_Categories"
Restrownames <- row.names(MinData[2:10,])

#View(firstrowname)
#View(Restrownames)

Newrowname <- substr(Restrownames,3,nchar(Restrownames))
#View(Newrowname)

NRN <- c(firstrowname,Newrowname)
#View(NRN)
row.names(MinData) <- NRN

View(MinData)

#write.csv(MinData,"aaa.csv")

MinData <- cbind(rownames(MinData), MinData)
rownames(MinData) <- NULL
colnames(MinData) <- c("TradeCtgry","TradeID",Colname)

Exportdata <- gather(MinData, "year", "Export", 3:23)
#view(Exportdata)
#dim(Exportdata)

#Exportdata$Trade_type <- c("Export")
#View(Exportdata)

#-----------------------------------------
#Exportdata <- Exportdata %>%
#  filter(TradeType!="Total Exports")
#view(Exportdata)
#-----------------------------------------

Trade_No <- paste("Trade" , seq(1:nrow(Exportdata)),sep = "")
Exportdata <- cbind(Trade_No, Exportdata)

#impTrade <- filter(cc$TradeType = c("Total Exports"))
#class(Exportdata)
#str(Exportdata)

#cc$TradeType <- as.character(cc$TradeType)

#View(Exportdata)

#==========================================================================================================
#Import Data sheet
#==========================================================================================================

my_Import_data <- read.xlsx("cpapublicationq42018.xlsx",sheet = "2 Imports",startRow = 4,colNames = TRUE,rowNames = TRUE,detectDates = TRUE)

#str(my_Import_data)
#View(my_Import_data)

#write.csv(my_Import_data, "my_Import_data.CSV")

Impctgry <- c(1,2,13,26,161,165,171,178,183,188)
ImpYrs <- c(1:22)

ImpData <- my_Import_data[Impctgry,ImpYrs]
View(ImpData)

Impcolname <- names(ImpData[,2:22])
#View(Impcolname)
#write.csv(ImpData,"ImpMinData.csv")

firstImprowname <- row.names(ImpData[1,])
Imprestrownames <- row.names(ImpData[2:10,])

#View(firstImprowname)
#View(Imprestrownames)

ImpNewrowname <- substr(Imprestrownames,3,nchar(Imprestrownames))
View(ImpNewrowname)

IMPNRN <- c(firstImprowname,ImpNewrowname)
View(IMPNRN)
row.names(ImpData) <- IMPNRN

View(ImpData)

#write.csv(ImpData,"ImpData.csv")

ImpData <- cbind(rownames(ImpData), ImpData)
rownames(ImpData) <- NULL
colnames(ImpData) <- c("TradeCtgry","TradeID",Impcolname)

Importdata <- gather(ImpData, "year", "Import", 3:23)
#view(Importdata)
#dim(Importdata)

#Importdata$Trade_type <- c("Import")
#View(Importdata)

#Importdata <- Importdata %>%
 # filter(TradeCtgry!="Total Imports")
#view(Importdata)


Trade_No <- paste("Imp" , seq(1:nrow(Importdata)),sep = "")
Importdata <- cbind(Trade_No, Importdata)


View(Importdata)

Import <- Importdata$Import


View(Exportdata)

Total <- cbind(Exportdata,Import)
View(Total)

write.csv(Total, "Trade.csv", row.names = FALSE)


