install.packages(GuardianR)


setwd("C:/Users/hp/Desktop/Project - DWBI/R stuffs")
library(GuardianR)
results <- parse_json_to_df(get_guardian("trade",
                        from.date="2019-01-01",
                        to.date="2019-01-28",
                        format="JSON",
                        api.key="bc13bccf-06e9-428f-8a88-e0968017d60e"));



                        
View(results)


#section="NULL",

results <- get_guardian("trade",
                          from.date="2019-01-01",
                          to.date="2019-01-28",
                        format="JSON"
                          api.key="bc13bccf-06e9-428f-8a88-e0968017d60e");

class(results)
typeof(results)
  results <- get_guardian("trade",
           from.date="2019-01-01",
           to.date="2019-01-28",
           format="JSON"
           api.key="bc13bccf-06e9-428f-8a88-e0968017d60e"));

str(results)
