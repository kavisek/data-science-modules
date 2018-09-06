library(ggvis)
library(readr)
options( sqldf.driver = "SQLite")


url <- 'http://people.terry.uga.edu/rwatson/data/carbon.txt'
carbon <- read_delim(url, delim=',')
# Select year(x) and CO2(y) to create a x-y point plot
# Specify red points, as you find that aesthetically pleasing
carbon %>% ggvis(~year,~CO2) %>% layer_points(fill:="red")
# Notice how '%>%' is used for creating a pipeline of commands


carbon %>% ggvis(~year,~CO2) %>% layer_points(fill:='red') %>% 
  scale_numeric('y',zero=T)

# Compute a new column containing the relative change in CO2
carbon$relCO2 = (carbon$CO2-280)/280
carbon %>% ggvis(~year,~relCO2) %>% layer_lines(stroke:='blue') %>% 
  scale_numeric('y',zero=T) %>% 
  add_axis('y', title = "CO2 ppm of the atmosphere", title_offset=50) %>% 
  add_axis('x', title ='Year', format = '####')


library(ggvis)
year <-  c(1804,1927,1960,1974,1987,1999,2012,2027,2046)
pop <-  (1:9)
df <-  data.frame(year,pop)
df %>% ggvis(~year, ~pop) %>% 
  layer_points(fill:="green") %>%
  layer_points(shape:="square") %>%
  add_axis('x', title = 'Year', format='d4', subdivide=1, values = seq(1800, 2050, by = 50)) %>%
  add_axis('y',title='Population')

library(readr)
library(sqldf)
x <- 'http://people.terry.uga.edu/rwatson/data/electricityprices2010_14.csv'
elec <- read_delim(x, delim=',')


#2a and 2c
maxcost <- sqldf("select max(cost) from elec")
mean <- sqldf("select avg(cost) from elec")
sqldf("select max(cost) from elec")
sqldf("select avg(cost) from elec")



#3a and 3c
url <- 'http://people.terry.uga.edu/rwatson/data/wealth.csv'
wealth <- read_delim(url, delim=',')
colnames(wealth)[2] = "GDPCapita"
colnames(wealth)[4] <- "WealthCapita"
#3a
wealth2 <- sqldf("select * from wealth order by GDPCapita")

#3b
sqldf("select avg(GDPCapita) from wealth")

#3c
ratio = sqldf("select GDPCapita/14722.06 from wealth")

### wealth$GDPCapital is same as Customer.CustomerID in SQL

cor.test(wealth$GDPCapital, wealth$?????)




# 6a 
# Read the file using RStudio's Import Datase
# set the column names as R puts an X in front of the year.
colnames(broccoli) <-  c('state',1974,1978,1982,1987,1992,1997,2002,2007)
library(reshape)
m <-  melt(broccoli,id='state')
colnames(m) <-  c('state','year','acres')  






cor.test(wealth$GDPCapita, wealth$WealthCapita)

unitCost <- c( 700, 200, 150, 50, 15, 3, 1) 
shipCost <- c( 10.00, 1.50, 1.00, 0.15, 0.15, 0.05, 0.01) 
item <- c(' TV set', 'DVD player', 'Vacuum cleaner', 'Scotch whisky', 'Coffee', 'Biscuits', 'Beer')
ratioCost = shipCost/unitCost

#Chapter15 Question 2

unitCost <- c( 700, 200, 150, 50, 15, 3, 1) 
shipCost <- c( 10.00, 1.50, 1.00, 0.15, 0.15, 0.05, 0.01)
relcost <- shipCost/unitCost*100


item <- c(' TV set', 'DVD player', 'Vacuum cleaner', 'Scotch whisky', 'Coffee', 'Biscuits', 'Beer')


cost <- data.frame(relcost, item)

cost %>% ggvis(~item, ~relcost) %>% 

carbon %>% ggvis(~year,~CO2) %>% layer_points(fill:="red")
###Hint for Q2
###reference code for ggvis
library(ggvis)
library(readr)
url <- 'http://people.terry.uga.edu/rwatson/data/carbon.txt'
carbon <- read_delim(url, delim=',')
# Select year(x) and CO2(y) to create a x-y point plot
# Specify red points, as you find that aesthetically pleasing
carbon %>% ggvis(~year,~CO2) %>% layer_points(fill:="red")
# Notice how '%>%' is used for creating a pipeline of commands


##Question 12
wurl <- 'http://people.terry.uga.edu/rwatson/data/weather2010-12.csv' 
w <- read.csv( wurl, sep =',', header = T) 
eurl <-'http://people.terry.uga.edu/rwatson/data/electricityprices2010_14.csv'
e <- read.csv( eurl, sep =',', header = T)

colnames(w[1]) <- timestamp
x <- sqldf("??????")

#### check how much of the data matches across the 
### two datasets
y <- sqldf("select * from w where timestamp not in (select timestamp .....)")

#### Question 12b


