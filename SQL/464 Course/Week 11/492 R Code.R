install.packages(birk)

# CO2 parts per million for 2000-2009 
co3 <- c( 369.40,371.07,373.17,375.78,377.52,379.76,381.85,383.71,385.57,384.78) 
co2 <- c( 369.40,371.07,373.17,375.78,377.52,379.76,381.85,383.71,385.57) 

year <- (2000: 2008) # a range of values 

# show values 
co2 
year 
# compute mean and standard deviation 
mean( co2) 
sd( co2) 
plot( year, co2)


a <- array(letters[seq( 1: 24)], c(4,3,2))

gender <- c(" m"," f"," f") 
age <- c( 5,8,3) 
df <- data.frame( gender, age)
df

t<- read.table("http://people.terry.uga.edu/rwatson/data/centralparktemps.txt", header = T, sep = ",")
###t <- read.table("c:/temp/centralparktemps.txt", header = T, sep =",")

head( t) # first few rowsm
tail( t) # last few rows 
dim( t) # dimension 
str( t) # structure of a dataset
class( t) #type of object

t <- read.table(url, header=T, sep=',')
# compute Celsius
t$Ctemp <-  round(conv_unit(t$temperature,F,C),1)




##########DOES NOT WORK ANYMORE
require(weathermetrics)
library(weathermetrics)
t$Ctemp = fahrenheit.to.celsius(t$temperature, round = 1)

?install
??install

library(birk)
<url <- "http://people.terry.uga.edu/rwatson/data/centralparktemps.txt"
t <- read.table(url, header=T, sep=',')
# compute Celsius
t$Ctemp <-  round(conv_unit(t$temperature,F,C),1)



###############
s<-read.table("C:/temp/meltExample.csv", sep=",")
colnames(s)<-c('year', 1:12)
m<-melt(s,id='year')
colnames(m)<-c('year','month','co2')
m

####################
require(RJDBC)
drv <- JDBC("com.mysql.jdbc.Driver", "C:/temp/mysql-connector-java-5.1.34")
conn <- dbConnect(drv, "jdbc:mysql://richardtwatson.com/Weather", "db2", "student")
library(dbConnect)
con <- dbConnect(MySQL(), user='nsaraf', password = 'Doors95', dbname="sakila", host = 'wmc3317-2.bus.sfu.ca')
dbListTables(con)
rs <- dbSendQuery(con, "select * from actor;")
d1 <- dbFetch(rs, n = 10) 
d1
d2 <- dbFetch(rs, n = -1)      # extract all remaining data
dbHasCompleted(rs)
d2 <- dbFetch(rs, n = -1) 
d2
dbDisconnect(con)


##########################   A PLOT

url <-  "http://people.terry.uga.edu/rwatson/data/NOAA-ESRL-CO2-Table-1.csv"
t <-read.table(url,header=T,sep=',')
t$CO2[t$CO2 == -99.99] <-  NA
plot(t$Year,t$CO2)


################## MERGING DATA

t1<- read.table("http://people.terry.uga.edu/rwatson/data/centralparktemps.txt", header = T, sep = ",")
head(t1)
tail(t1)
str(t1)
t1a <- data.frame(t1$year, t1$month)



url <-  "http://people.terry.uga.edu/rwatson/data/NOAA-ESRL-CO2-Table-1.csv"
t2 <-read.table(url,header=T,sep=',')
head(t2)

head(t2a)


t<- read.table("http://people.terry.uga.edu/rwatson/data/centralparktemps.txt", header = T, sep = ",")
a <- aggregate( t $ temperature, by = list( t $ year), FUN = mean)
colnames( a) = c(' year', 'meanTemp')

require(sqldf)
library(sqldf)
options(sqldf.driver = "SQLite") # to avoid a conflict with RMySQL
x <- sqldf("select * from t")





# Select year(x) and CO2(y) to create a x-y point plot
# Specify red points, as you find that aesthetically pleasing
ggplot(carbon,aes(year,CO2)) + geom_point(color='red')
# Add some axes labels
# Notice how '+' is used for commands that extend over one line
ggplot(carbon,aes(year,CO2)) + geom_point(color='red') +
  xlab('Year') + ylab('CO2 ppm of the atmosphere')


data<- read.table("http://dl.dropbox.com/u/6960256/data/manheim.txt", sep=',', header=T)
head(data)


# create a list of 10 integers
ints <- 1:10
# equivalent to ints <- c(1,2,3,4,5,6,7,8,9,10)
# compute the squares
result <- sapply(ints,function(x) x^2)

require(rmr2)
rmr.options(backend = "local") # local or hadoop
# load a list of 10 integers into HDFS 
hdfs.ints = to.dfs(1:10)




require(rmr2)
rmr.options(backend = "local") # local or hadoop
# load a list of 10 integers into HDFS 
hdfs.ints = to.dfs(1:1000)
# mapper for the key-value pairs to compute squares
mapper <- function(k,v) {
  key <- v
  value <- key^2
  keyval(key,value)
}
# run MapReduce 
out = mapreduce(input = hdfs.ints, map = mapper)
# convert to a data frame
df1 = as.data.frame(from.dfs(out))
colnames(df1) = c('n', 'n^2')
#display the results
df1




small.ints = to.dfs(1:1000)
mapreduce(
  input = small.ints, 
  map = function(k, v) cbind(v, v^2))



colnames(t)
a<-sqldf("select year, max(temperature) as max, min(temperature) as min, avg(temperature) from t group by year")
