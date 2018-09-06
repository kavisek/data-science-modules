library(readr)
library(sqldf)
x <- "http://people.terry.uga.edu/rwatson/data/elcticityprices2010_14.crs"
elec  <- read_delim(x, delim= ',')

#2a
maxcost <- sqldf("select max(cost) from elec")
#2b
mincost <- sqldf("select min(cost) from elec")
#2C
mean <- sqldf("select avg(cost) from elec")



library(readr)
library(sqldf)
x <- "people.terry.uga.edu/rwatson/data/wealth.csv"
wealth  <- read_delim(x, delim= ',')
colname(wealth)[2]
colname(wealth)[4]



#Not on data
sqldf("select avg(cost) from elec")
sqldf("select max(cost) from elec")