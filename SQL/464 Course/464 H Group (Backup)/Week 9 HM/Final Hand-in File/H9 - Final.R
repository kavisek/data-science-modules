
#--------------------------- Question  1 -------------------------------

#14-2a -------------------------------------------------------

install.packages("reader")
install.packages("sqldf")

library(readr)
library(sqldf)
x <- "http://people.terry.uga.edu/rwatson/data/electricityprices2010_14.csv"
elec <- read_delim(x, delim= ',')

maxcost <- sqldf("select max(cost) from elec")

#14-2d -------------------------------------------------------

mediancost <- sqldf("select(cost) where  from elec")

#14-3b -------------------------------------------------------

library(readr)
library(sqldf)
x <- "http://people.terry.uga.edu/rwatson/data/wealth.csv"
wealth  <- read_delim(x, delim= ',')
colnames(wealth)[2] = "GDPPerCapital"
colnames(wealth)[3] = "WealthPerCapital"
colnames(wealth)[4] = "WealthCapital"

wealth2 <- sqldf("select * from wealth order by GDPPerCapital")
sqldf("select avg(GDPPerCapital) from wealth")

#14-3d -------------------------------------------------------

#Correlation Not done in class, Wealth & GDP Capital


cor.test(wealth $ GDPPerCapital, wealth $ WealthPerCapital)


#14-6b -------------------------------------------------------

install.packages("reshape")
install.packages("birk")

library(reshape)
library(readr)
library(sqldf)
library(birk)


x <- "Kavi/Desktop/Clean.csv"
colnames(x) <-  c('state',1974,1978,1982,1987,1992,1997,2002,2007)
library(reshape)

m <-  melt(x,id='state')
colnames(m) <-  c('state','year','acres') 

#Add a column to a and round to two decimal place

x $ Hectare = round( conv_unit( x $ acres, acre, hectare), 2) 

# round to two decimal,  acre and hectare are set vareables form the documentation



#15-2  -------------------------------------------------------

library("ggvis", lib.loc="\\\\psf/Home/Documents/R/win-library/3.2")
library( ggvis) 
library( readr)
unitCost <- c( 700, 200, 150, 50, 15, 3, 1) 
shipCost <- c( 10.00, 1.50, 1.00, 0.15, 0.15, 0.05, 0.01) 
item <- c(' TV set', 'DVD player', 'Vacuum cleaner', 'Scotch whisky', 'Coffee', 'Biscuits', 'Beer')
ratioCost = shipCost/unitCost
relcost <- shipCost/unitCost*100
cost <- data.frame (relcost,item)
cost %>%ggvis(~item, ~relcost)


#15-12b ------------------------------------------------------

library("ggvis", lib.loc="\\\\psf/Home/Documents/R/win-library/3.2")
library( ggvis) 
library( readr)

wurl <- 'http://people.terry.uga.edu/rwatson/data/weather2010-12.csv'
w <- read.csv( wurl, sep =',', header = T) 
eurl <- 'http://people.terry.uga.edu/rwatson/data/electricityprices2010_14.csv' 
e <- read.csv( eurl, sep =',', header = T)

colnames(w)[2] = "Temperture"
colnames(w)[1] = "Timestamp"
colnames(e)[2] = "EletricityPrices"
colnames(e)[1] = "Timestamp"

 z <- sqldf("select Temperture, EletricityPrices from w 
	  inner join e
	  	on w.Timestamp == e.Timestamp")
       
#Plot Data
#Show the points and the line
z %>% ggvis(~EletricityPrices,~Temperture)


#15-12b ------------------------------------------------------

library("ggvis", lib.loc="\\\\psf/Home/Documents/R/win-library/3.2")
library( ggvis) 
library( readr)

wurl <- 'http://people.terry.uga.edu/rwatson/data/weather2010-12.csv'
w <- read.csv( wurl, sep =',', header = T) 
eurl <- 'http://people.terry.uga.edu/rwatson/data/electricityprices2010_14.csv' 
e <- read.csv( eurl, sep =',', header = T)

colnames(w)[2] = "Temperture"
colnames(w)[1] = "Timestamp"
colnames(e)[2] = "EletricityPrices"
colnames(e)[1] = "Timestamp"

z <- sqldf("select Temperture, EletricityPrices from w 
           inner join e
           on w.Timestamp == e.Timestamp")

#Plot Data
#Show the points and the line
z %>% ggvis(~EletricityPrices,~Temperture)


#--------------------------- Question  2 -------------------------------

january_sales <- read.csv("C:/temp/january_sales.csv", sep=";")

library(ggvis)

library(dplyr)

january_sales2 <- january_sales %>% mutate(store_id = factor(store_id))

january_sales2 %>% ggvis(~store_id, ~sale_total, fill := "red") %>%
  layer_bars()















