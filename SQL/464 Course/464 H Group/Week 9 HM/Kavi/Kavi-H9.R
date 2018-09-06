install.packages("reader")
install.packages("sqldf")

library(readr)
library(sqldf)
x <- "http://people.terry.uga.edu/rwatson/data/electricityprices2010_14.csv"
elec <- read_delim(x, delim= ',')

#14-2a -------------------------------------------------------
maxcost <- sqldf("select max(cost) from elec")
#14-2b -------------------------------------------------------
mincost <- sqldf("select min(cost) from elec")
#14-2c -------------------------------------------------------
mean <- sqldf("select avg(cost) from elec")
#14-2d -------------------------------------------------------


#14-3a -------------------------------------------------------

library(readr)
library(sqldf)
x <- "people.terry.uga.edu/rwatson/data/wealth.csv"
wealth  <- read_delim(x, delim= ',')
colname(wealth)[2] = "GDPCapita"
colname(wealth)[4] = "Wealth Capita"

#14-3b -------------------------------------------------------

wealth2 <- sqldf("select * from wealth order by GDPCaita")
sqldf("selcet avg(GDGCapita) from wealth")

#14-3c -------------------------------------------------------
ratio = sqldf("select (GDPCapita/14722.06)from wealth")

#14-3d -------------------------------------------------------

#Correlation Not done in class, Wealth & GDP Capital
cor.test(wealth $ GDPCapital, wealth$???)


#14-6a -------------------------------------------------------

#Change to CSV and remove all the headers, remove the bottom section
#of the document. Empty blank rows. Find and replace dashes, claen the work shee

library(readr)
library(sqldf)
x <- "people.terry.uga.edu/rwatson/data/wealth.csv"


library(reshape)

#14-6b -------------------------------------------------------



#15-2  -------------------------------------------------------


library(ggvis)

unitCost <- c( 700, 200, 150, 50, 15, 3, 1) 
shipCost <- c( 10.00, 1.50, 1.00, 0.15, 0.15, 0.05, 0.01) 
item <- c(' TV set', 'DVD player', 'Vacuum cleaner', 'Scotch whisky', 'Coffee', 'Biscuits', 'Beer')
ratioCost = shipCost/unitCost*100

relcost <- shipCost/unitCost
cost <- data.frame (relcost,item)
cost %> ggvis(~item, ~relcost)



options( sqldf.driver = "SQLite")
url <- 'http:/people.terry.uga.edu/rwatson/data/carbon.txt'
carbon <- read_delim(url,delim=',')
carbon %>% ggvis(~year,~CO2) %layer_points(fill:="red")



#15-12b ------------------------------------------------------




#Not on data
sqldf("select avg(cost) from elec")
sqldf("select max(cost) from elec")