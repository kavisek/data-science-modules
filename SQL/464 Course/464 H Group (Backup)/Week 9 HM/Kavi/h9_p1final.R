#2b)
electricityprices2010_14 <- read.csv("C:/temp/electricityprices2010_14.csv")
sqldf('select min(`cost`) from electricityprices2010_14')

#2d)
electricityprices2010_14 <- read.csv("C:/temp/electricityprices2010_14.csv")
sqldf('select median(`cost`) from electricityprices2010_14')

#3b)
library(readr)
library(sqldf)
url <-  'http://people.terry.uga.edu/rwatson/data/wealth.csv'
wealth <-  read_delim(url,delim = ',')
View (wealth)
sqldf('select avg(`GDP per capita`) from wealth')

#3d)
cor.test(wealth$`GDP per capita`,wealth$`Wealth per capita`)