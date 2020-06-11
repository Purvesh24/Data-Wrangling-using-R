setwd("C:/Users/hp/Desktop/Project - DWBI/R stuffs")

install.packages("Quandl")
install.packages("lubridate")
library(Quandl)
library(dplyr)
library(lubridate)

Total_Categories=Quandl("UKONS/DYDC_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Total_Categories$Workforce <- "Total_Categories"

Agriculture_forestry_fishing=Quandl("UKONS/JWR5_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Agriculture_forestry_fishing$Workforce <- "Products of agriculture, forestry & fishing"

Mining_quarrying=Quandl("UKONS/JWR6_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Mining_quarrying$Workforce <- "Mining & quarrying"


Manufacturing=Quandl("UKONS/JWR7_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Manufacturing$Workforce <- "Manufactured products" 


Electricity_gas_stem = Quandl("UKONS/JWR8_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Electricity_gas_stem$Workforce <- "Electricity, gas, steam & air conditioning"


Water_supply_sewerage_waste_remediation = Quandl("UKONS/JWR9_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Water_supply_sewerage_waste_remediation$Workforce <- "Water supply, sewerage & waste management"

Information_communication= Quandl("UKONS/JWS6_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Information_communication$Workforce <- "Information & communication services"


Professional_scientific_technical=Quandl("UKONS/JWS9_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Professional_scientific_technical$Workforce <- "Professional, scientific & technical services"

Arts_entertainment_recreation=Quandl("UKONS/JWT6_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Arts_entertainment_recreation$Workforce <- "Arts, entertainment & recreation"


Other_service=Quandl("UKONS/JWT7_A", api_key="8-oGU3hr1sR6wQYGz8nk", collapse="annual")
Other_service$Workforce <- "Other services"

#Agriculture_forestry_fishing,Mining_quarrying,Manufacturing,Electricity_gas_stem,Water_supply_sewerage_waste_remediation,Information_communication,Professional_scientific_technical,Arts_entertainment_recreation



a <- rbind(Agriculture_forestry_fishing,Mining_quarrying)
class(Agriculture_forestry_fishing)
class(Mining_quarrying)
   
b <- rbind(a,Manufacturing)
c <- rbind(b,Electricity_gas_stem)
d <- rbind(c,Water_supply_sewerage_waste_remediation)
e <- rbind(d,Information_communication)
f <- rbind(e,Professional_scientific_technical)
g <- rbind(f,Arts_entertainment_recreation)
h <- rbind(g,Other_service)
i <- rbind(h,Total_Categories)



i$Date <- year(i$Date)
View(i)
write.csv(i,"UK_Workforce1.csv",row.names = FALSE)

View(i)
str(i)


