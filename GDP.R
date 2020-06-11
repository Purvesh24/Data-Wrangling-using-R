setwd("C:/Users/hp/Desktop/Project - DWBI/R stuffs")

library("openxlsx")

GDP <- read.xlsx("Statista- statistic_id281744_united-kingdom_-gross-domestic-product--gdp--2000-to-2018.xlsx",sheet = "Data",startRow = 5,colNames = TRUE,rowNames = FALSE,detectDates = TRUE)
colnames(GDP) <- c("Year","GDP in trillion GBP")
GDP_Growth <- read.xlsx("Statista-statistic_id281734_united-kingdom-gdp-growth-2000-2018.xlsx",sheet = "Data",startRow = 5,colNames = TRUE,rowNames = FALSE,detectDates = TRUE)
GDP$Growth <- GDP_Growth$Annual.growth

View(GDP)

write.csv(GDP,"GDP.csv",row.names = FALSE)
