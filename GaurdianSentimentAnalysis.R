
install.packages("dplyr")
install.packages("xlsx")
install.packages("syuzhet")


getwd()
setwd("C:/Users/hp/Desktop/Project - DWBI/R stuffs")
library(xlsx)
library (jsonlite)
library(dplyr)
library(syuzhet)
library(lubridate)
i <- 1

#content <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20AND%20(trade%20import%20export%20deals)&from-date=2016-01-01&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)

content1 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2008-01-01&to-date=2008-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content1 <- as.data.frame(content1)
View(content1)

content2 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2009-01-01&to-date=2009-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content2 <- as.data.frame(content2)
#View(content2)

content2 <- rbind(content1,content2)


content3 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2010-01-01&to-date=2010-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content3 <- as.data.frame(content3)
#View(content3)
content3 <- rbind(content2,content3)

content4 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2011-01-01&to-date=2011-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content4 <- as.data.frame(content4)
#View(content4)
content4 <- rbind(content3,content4)


content5 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2012-01-01&to-date=2012-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content5 <- as.data.frame(content5)
#View(content5)
content5 <- rbind(content4,content5)

content6 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2013-01-01&to-date=2013-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content6 <- as.data.frame(content6)
#View(content6)
content6 <- rbind(content5,content6)

content7 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2014-01-01&to-date=2014-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content7 <- as.data.frame(content7)
#View(content7)
content7 <- rbind(content6,content7)


content8 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2015-01-01&to-date=2015-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content8 <- as.data.frame(content8)
#View(content7)
content8 <- rbind(content7,content8)

content9 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2016-01-01&to-date=2016-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content9 <- as.data.frame(content9)
#View(content7)
content9 <- rbind(content8,content9)


content10 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2017-01-01&to-date=2017-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content10 <- as.data.frame(content10)
#View(content7)
content10 <- rbind(content9,content10)


content11 <- fromJSON ("https://content.guardianapis.com/search?q=Brexit%20OR%20(trade%20import%20export%20deals)&from-date=2018-01-01&to-date=2018-12-31&api-key=bc13bccf-06e9-428f-8a88-e0968017d60e&page-size=200&order-by=relevance&production-office=uk&show-fields=body",flatten = TRUE)
content11 <- as.data.frame(content11)
#View(content7)
content11 <- rbind(content10,content11)



NewsResponse <- content11

NewsResponse$response.results.webPublicationDate <- as.Date(NewsResponse$response.results.webPublicationDate)
Newsyear <- year(NewsResponse$response.results.webPublicationDate)
#str(NewsResponse)

#View(NewsResponse)

#str(NewsResponse)
#write.csv(NewsResponse, file="Response.csv")

#Newsbody<-NewsResponse$response.results.fields.body
#Newsbody <- as.data.frame(Newsbody)
#View(news)
#class(Newsbody)

NewsResponse$response.results.fields.Newsbody <- trimws((gsub("<.*?>","",NewsResponse$response.results.fields.body)))
#View(NewsResponse)
#class(NewsResponse)


#Newsbody <- trimws((gsub("<.*?>","",Newsbody)))
write.csv(NewsResponse,"NewsResponse.csv")




#View(Newsbody)
#class(NewsResponse)

#=============================================================================================================
  
#ignore

#cleanFun <- function(htmlString) 
#  {
#  return(gsub("<.*?>","",htmlString))
#}

# Clear whitespaces
#ss$bodyCleaned=trimws(cleanFun(ss$response.results.fields.body))

#View(ss)
#=============================================================================================================
  
mysentiment_Classification <- get_nrc_sentiment(NewsResponse$response.results.fields.Newsbody)

NewsBody_Consol_sentiments <- get_sentiment(NewsResponse$response.results.fields.Newsbody)
bing_Senti <- get_sentiment(NewsResponse$response.results.fields.Newsbody, method ="bing")
nrc_Senti <- get_sentiment(NewsResponse$response.results.fields.Newsbody, method ="nrc")
afinn_Senti <- get_sentiment(NewsResponse$response.results.fields.Newsbody, method ="afinn")

Anger_Sentiment <- mysentiment_Classification$anger
Anticipation_Sentiment <- mysentiment_Classification$anticipation
Disgust_Sentiment <- mysentiment_Classification$disgust
Fear_Sentiment <- mysentiment_Classification$fear
Joy_Sentiment <- mysentiment_Classification$joy
Sadness_Sentiment <- mysentiment_Classification$sadness
Surprise_Sentiment <- mysentiment_Classification$surprise
Trust_Sentiment <- mysentiment_Classification $ trust
Negative_Sentiment <- mysentiment_Classification$negative
Positive_Sentiment <- mysentiment_Classification$positive


sum <- summary(mysentiment_Classification)
View(sum)
#View(Polarity)
Polarity <- data.frame(Newsyear,Positive_Sentiment,Negative_Sentiment)
Polarity = as.data.frame(lapply(Polarity,rep,2))
Polar_Sentiment_ID <- seq(1:nrow(Polarity))
Polarity <- cbind(Polar_Sentiment_ID,Polarity)
#View(Polarity)
write.csv(Polarity,file = "polarity.csv")

FullSentiments <- data.frame(Newsyear,Anger_Sentiment,Anticipation_Sentiment,Disgust_Sentiment,Fear_Sentiment,Joy_Sentiment,Sadness_Sentiment,Surprise_Sentiment,Trust_Sentiment,Negative_Sentiment,Positive_Sentiment,nrc_Senti,bing_Senti,afinn_Senti,NewsBody_Consol_sentiments)
finalsentiments = as.data.frame(lapply(FullSentiments,rep,2))

Sentiment_ID <- seq(1:nrow(FullSentiments))
FullSentiments <- cbind(Sentiment_ID, FullSentiments)
View(FullSentiments)


write.csv(Polarity,"Polarity.csv",row.names = FALSE)
write.csv(FullSentiments,"FullSentiments.csv",row.names = FALSE)


#View(mysentiment_Classification)
#finalsentiments = as.data.frame(lapply(FullSentiments,rep,2))
#View(finalsentiments)


#boxplot(Polarity)

 #sentiment_vector <- get_sentiment(ss$response.results.fields.newbody, method = "syuzhet")
#boxplot(sentiment_vector)




