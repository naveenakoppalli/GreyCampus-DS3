library(tidyverse)
covid19_data <- read.csv("COVID19.csv",
                         na.strings = c("","NA"),
                         stringsAsFactors = FALSE)
view(covid19_data)                    
head(covid19_data)

##### removing an "x"column
covid19_data %>%
  select(-2) -> dataset

head(dataset)
### converting data from char to integer

#install.packages("moments")
library(moments) 
str(dataset)
dataset$TotalCases <- gsub(",","",dataset$TotalCases)
dataset$TotalCases <- as.integer(dataset$TotalCases)
dataset$NewCases <- gsub(",","",dataset$NewCases)
dataset$NewCases <-as.integer(dataset$NewCases)
dataset$TotalDeaths <- gsub(",","",dataset$TotalDeaths)
dataset$TotalDeaths <-as.integer(dataset$TotalDeaths)
dataset$TotalRecovered <- gsub(",","",dataset$TotalRecovered)
dataset$TotalRecovered <-as.integer(dataset$TotalRecovered)
dataset$NewRecovered <- gsub(",","",dataset$NewRecovered)
dataset$NewRecovered <-as.integer(dataset$NewRecovered)
dataset$ActiveCases <- gsub(",","",dataset$ActiveCases)
dataset$ActiveCases <-as.integer(dataset$ActiveCases)
dataset$Serious.Critical <- gsub(",","",dataset$Serious.Critical)
dataset$Serious.Critical <-as.integer(dataset$Serious.Critical)
dataset$Tot.Cases.1M.pop <- gsub(",","",dataset$Tot.Cases.1M.pop)
dataset$Tot.Cases.1M.pop <-as.integer(dataset$Tot.Cases.1M.pop)
dataset$Deaths.1M.pop <- gsub(",","",dataset$Deaths.1M.pop)
dataset$Deaths.1M.pop <-as.integer(dataset$Deaths.1M.pop)
dataset$TotalTests <- gsub(",","",dataset$TotalTests)
dataset$TotalTests <-as.integer(dataset$TotalTests)
dataset$Tests.1M.pop <- gsub(",","",dataset$Tests.1M.pop)
dataset$Tests.1M.pop <-as.integer(dataset$Tests.1M.pop)
dataset$Population <- gsub(",","",dataset$Population)
dataset$Population <-as.integer(dataset$Population)
dataset$X1.Caseevery.X.ppl <- gsub(",","",dataset$X1.Caseevery.X.ppl)
dataset$X1.Caseevery.X.ppl <-as.integer(dataset$X1.Caseevery.X.ppl)
dataset$X1.Deathevery.X.ppl <- gsub(",","",dataset$X1.Deathevery.X.ppl)
dataset$X1.Deathevery.X.ppl<-as.integer(dataset$X1.Deathevery.X.ppl)
dataset$X1.Testevery.X.ppl <- gsub(",","",dataset$X1.Testevery.X.ppl)
dataset$X1.Testevery.X.ppl <-as.integer(dataset$X1.Testevery.X.ppl)
str(dataset)
hist(dataset$TotalCases)



###### Numerical summary 

mean(dataset$TotalCases, na.rm = TRUE)
median(dataset$TotalCases,na.rm = TRUE)
mode(dataset$TotalCases)
D <- table(dataset$TotalCases)
D

## normally distribution

skewness(dataset$TotalCases,na.rm = TRUE)
hist(dataset$TotalCases)

####checking for percentage of NA

colSums(is.na(dataset))
percent <- function(x){
  (sum(is.na(x))/length(x))*100
}
col <- apply(dataset,2,percent)
col


#### removing unwanted data

dataset %>%
  select(-X1.Caseevery.X.ppl:-X1.Testevery.X.ppl) ->Covid19data
Covid19data




##### Step 3


boxplot(Covid19data$TotalCases,main="TotalCases",horizontal = TRUE,
        border = c("#999999", "#E69F00", "#56B4E9"),
        col="maroon")

boxplot(Covid19data$TotalDeaths,main="TotalDeaths",horizontal = TRUE,
        border = c("#999999", "#E69F00", "#56B4E9"),
        col="Red")

boxplot(Covid19data$TotalRecovered,main="TotalRecovery",horizontal = TRUE,
        border = c("#999999", "#E69F00", "#56B4E9"),
        col="steelblue")




#######2



library(ggplot2)
dataset$TotalCases <- gsub(",","",dataset$TotalCases)
dataset$Population <- gsub(",","",dataset$Population)
Covid19data %>%
  ggplot(aes(x = TotalCases, y = Population))+
  geom_point()+
  labs(title = "Correlation between total cases and total population",
       x = "TotalCases",
       y = "Population")+
  




with(Covid19data, plot(TotalCases, Population),pch= 20)
title(main = "covid 19 data sets")
model <- lm(TotalCases ~ Population , Covid19data)
abline(model , lwd=2)


######3



Covid19data %>%
  ggplot(aes(x = TotalCases, y = Population))
  geom_point()+
  labs(title = "Correlation between total cases of 1M population and total population",
       x = "TotalCasesPop",
       y = "Population")

with(Covid19data,main= "corelation of Totalcases/1MP and POpulation",plot(TotalCases,Population))


######## 4



boxplot(TotalCases ~ Tests.1M.pop, data = Covid19data, frame = FALSE)



##########5 



Covid19data %>%
  ggplot(aes(x = TotalCases, y = TotalDeaths))+
  geom_point()+
  labs(title = "Correlation between total cases and total deaths",
       x = "Total Cases",
       y = "Total Deaths")

#########6 


Covid19data %>%
  ggplot(aes(x = TotalCases, y = TotalDeaths))+
  geom_point()+
  labs(title = "Correlation between total cases and total Deaths per population",
       x = "Totalcases",
       y = "Deaths")


########7








ggplot(Covid19data, aes(TotalCases, Continent))+
  geom_point(colour = "maroon", size = 3)



#####8


ggplot(Covid19data, aes(Deaths, Continent))+
  geom_point(colour = "red", size = 3)


#########9

ggplot(Covid19data, aes(TotalTests, Tests))+
  geom_point(colour = "maroon", size = 3)





ggplot(Covid19data, aes(TotalTests, Continent))+
  geom_point(colour = "maroon", size = 3)


###mean= median=mode its normally distributed
summary(Covid19data$Tests)
skewness(Covid19data$TotalCases,na.rm = TRUE)
hist(Covid19data$Tests)

qqnorm(Covid19data$Tests)
qqline(Covid19data$Tests)








