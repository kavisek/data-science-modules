1. Complete the following even numbered problems from chapters 14 and 15: Chapter 14 – 2b, 2d, 3b and 3d. Also, use the solution from textbook website for 6a and use it to solve 6b.
Chapter 15 – 2 and 12 b
Wherever possible use sqldf package and create SQL queries to accomplish the task, instead of using other R functions/packages. Simply submit the code assuming the input data is at the location c:/temp

14-2b



14-2d

14-3b

14-3d


14-6b


15 - 2


15 - 12b


2. Use your term project data to create one interesting visual using R as fol- lows:Identify the visual you want to depict.
Create/transform the data on MySQL server using SQL. Either export it as .csv file and import it into R OR use R’s dbconnect function to pull the data directly into your local machine. Wherever needed use sqldf to create the required data frame in R. Then use ‘ggvis’ package to draw the visual.




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
