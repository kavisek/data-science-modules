getwd()
setwd("/Users/Data_Freak/Desktop/")
p <- read.csv("Pokemon.csv", header=TRUE)
p <- p[2:12]



#package Intallations

require("RColorBrewer")
require("psych")


#Value Assignment

name <- p$Name
t1 <- p$Type.1
t2 <- p$Type.2
total <- p$Total
hp <- p$HP
att <- p$Attack
def <- p$Defense
satt <- p$Sp..Atk
sdef <- p$Sp..Def
spd <- p$Speed
gen <- p$Generation
leg <- p$Legendary

#Basic Summary of Data_Freak

View(p)
str(p)

summary(p)
summary(p$Name)
summary(p$Type.1)
summary(p$Type.2)
summary(p$Total)
summary(p$HP)
summary(p$Attack)
summary(p$Defense)
summary(p$Sp_Atk)
summary(p$Sp_Def)
summary(p$Speed)
summary(p$Generation)
summary(p$Legendary)


min(hp)
max(hp, att)

mean(hp, att, def)
mean(hp, trimmed = 0.05)
mean(hp, trimmed = 0.10)
mean(hp, trimmed = 0.20)
mean(hp, trimmed = 0.50)

IQR(hp)
mad(hp)
sd(hp)

median(p$HP, p$Attack, p$Defense, p$Sp_Atk)

fivenum(att)
describe(att)






hist(p$Total)
hist(p$HP)
hist(p$Attack)
hist(p$Defense)
hist(p$Sp..Atk)
hist(p$S..Def)
hist(p$Speed)
hist(p$Generation)


hist(hp, 
	main = "Frequency of Pokemon HP", 
	xlab  = "HP Amount", 
	ylab = "Pokemon  Frequency",  
	col = "slategray3", 
	border = 0, 
	las = 1
	)

boxplot.stats(total)
boxplot( total, 
  horizontal = TRUE,
  notch = FALSE,
  las = 1, 
  boxwex = 0.5, 
  whisklty = 1,
  staplety = 0,
  outpch = 16,
  xlab = "Strength", 
  ylab = "Number",
  main = "Pokemon Stats"
)


boxplot( 
  hp, 
  att, 
  def, 
  satt, 
  sdef, 
  spd, 
  horizontal = TRUE,
  notch = FALSE,
  las = 0, 
  boxwex = 0.5, 
  whisklty = 1,
  staplety = 0,
  outpch = 16,
  xlab = "Strength", 
  ylab = "Number",
  main = "Pokemon Stats"
)


#Creating Random Variable 

rn1 <- rnorm(1000)
rn2 <- rnorm(10000000)



#SubGrouping within the Dataset



mean(att)
mean(att[gen==1])
mean(att[gen==2])
mean(att[gen==3])
mean(att[t1=="Grass" | t2=="Grass"])
mean(att[t1=="Fire" | t2=="Fire"])
mean(att[att > median(att)])

fire <- p[p$Type.1=="Fire" | p$Type.2=="Fire",]
View(fire)
mean(fire)






























