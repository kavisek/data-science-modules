library(readr)
library(sqldf)
x <- "http://people.terry.uga.edu/rwatson/data/elcticityprices2010_14.crv"
elec <- read_delim(x, delim= ',')

#2a
maxcost <- sqldf("select max(cost) from elec")
#2b
mincost <- sqldf("select min(cost) from elec")
#2C
mean <- sqldf("select avg(cost) from elec")


#3a
library(readr)
library(sqldf)
x <- "people.terry.uga.edu/rwatson/data/wealth.csv"
wealth  <- read_delim(x, delim= ',')
colname(wealth)[2] = "GDPCapita"
colname(wealth)[4] = "Wealth Capita"



#3b
wealth2 <- sqldf("select * from wealth order by GDPCaita")
sqldf("selcet avg(GDGCapita) from wealth")

#3c
ratio = sqldf("select (GDPCapita/14722.06)from wealth")

#3d Correlation Not done in class, Wealth & GDP Capital
cor.test(wealth $ GDPCapital, wealth$???)





#Not on data
sqldf("select avg(cost) from elec")
sqldf("select max(cost) from elec")