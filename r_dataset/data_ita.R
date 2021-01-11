############################
####BUILDING THE DATASET####
############################
options(scipen=999) #This will prevent scientific notation in plots' axes
setwd("~/github/covid_19_data")
covid_ita1 <- read.delim("dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv",sep=",",header=T) #This is the file containing the data for the whole country. I use it as data frame
new_columns <- data.frame(codice_regione=0,denominazione_regione="Italia",lat=41.8719,long=12.5674) #These columns are present in the file containing the data for the Italian regions.
covid_ita2 <- cbind(covid_ita1,new_columns) #I attach them here too, because otherwise I would have problems merging the two datasets
covid_ita3 <- covid_ita2[,c(1,2,21,22,23,24,3,4,5,6,7,8,9,10,11,12,13,14,15,16)] #Here I put the columns in the correct order (the same order as for the regional data frame) and I remove the new variable "note"
str(covid_ita3) #the "data" and "stato" variables are factors. I need to convert the "data" variable in date format.
date <- as.Date(covid_ita1$data,format="%Y-%m-%d")
covid_ita4 <- covid_ita3[,2:(length(covid_ita3))] #I remove the old date variable from the data frame
covid_ita <- cbind(date,covid_ita4) #I replace the date variable with the new one in the correct format
str(covid_ita)
plot(covid_ita$date,covid_ita$totale_casi,type="l",cex.axis=.7,xlab="Data",ylab="Totale casi in Italia")
covid_reg1 <- read.delim("dati-regioni/dpc-covid19-ita-regioni.csv",sep=",",header=T) #Here I load the regional data frame. I already know I have to substitute the date variable with the one in date format.
covid_reg2 <- covid_reg1[order(covid_reg1$codice_regione),] #Since the regional data are ordered by date, not region code, before merging the two data frames I have to change the way in which the regional data are ordered
covid_reg3 <- covid_reg2[,2:(length(covid_reg1)-4)] #Here I remove the date and notes variables, same as I did for the Italian data
covid_reg <- cbind(date,covid_reg3)
names(covid_ita)
names(covid_reg)
covid_data <- rbind(covid_ita,covid_reg) #Here I merge the two datasets
covid_data$mortalità <- covid_data$deceduti/covid_data$totale_casi #Mortality rate
covid_data$nuovi_tamponi <- covid_data$nuovi_positivi/covid_data$tamponi #Capacity of tampoons to signal the increase of contagions
covid_data$decreto_legge <- as.numeric(covid_data$date=="2020-02-23") #D.L. 6/2020 (2020/02/23), converted to L. 13/2020 (2020/03/05)
covid_data$dpcm1 <- as.numeric(covid_data$date=="2020-02-23") #Measures of containment of COVID-19 contagions (DPCM 2020/02/23)
covid_data$dpcm2 <- as.numeric(covid_data$date=="2020-02-25") #Further measures of containment of COVID-19 contagions (DPCM 2020/02/25)
covid_data$dpcm3 <- as.numeric(covid_data$date=="2020-03-01") #Further measures of containment of COVID-19 contagions (DPCM 2020/03/01)
covid_data$dpcm4 <- as.numeric(covid_data$date=="2020-03-04") #Further measures of containment of COVID-19 contagions (DPCM 2020/03/04)
covid_data$dpcm5 <- as.numeric(covid_data$date=="2020-03-08") #Further measures of containment of COVID-19 contagions - Movement and school lockdown of Lombardia + 14 provinces (DPCM 2020/03/08)
covid_data$dpcm6 <- as.numeric(covid_data$date=="2020-03-09") #Further measures of containment of COVID-19 contagions - Movement and school lockdown of Italy (DPCM 2020/03/09)
covid_data$dpcm7 <- as.numeric(covid_data$date=="2020-03-11") #Further measures of containment of COVID-19 contagions - Economic lockdown of Italy (DPCM 2020/03/11)
covid_data$dpcm8 <- as.numeric(covid_data$date=="2020-03-22") #Further measures of containment of COVID-19 contagions (DPCM 2020/03/22)
covid_data$dpcm9 <- as.numeric(covid_data$date=="2020-04-26") #First release of the lockdown from 2020/05/04 (DPCM 2020/04/26)
covid_data$pre_esodo <- as.numeric(covid_data$date=="2020-02-23") #Article of "La Repubblica" ("Coronavirus, l'illusione della grande fuga da Milano. Ecco i veri numeri degli spostamenti verso sud" April, 23) reports that the exodus from Milan to the South of Italy has happened on February, 23 rather than during March, as feared
covid_data$mado <- as.numeric(covid_data$date=="2020-03-07") #People from Madonna di Casmpiglio to Messina
covid_data$esodo1 <- as.numeric(covid_data$date=="2020-03-08") #First coming back of people from Northern Italy to the South (following the DPCM rendering Lombardia and fourteen provinces from Piemonte, Veneto, Emilia Romagna and Marche "Zona rossa")
covid_data$esodo2 <- as.numeric(covid_data$date=="2020-03-13") #Second coming back of people from Northern Italy to the South (following the DPCM rendering the whole country "Zona rossa" and shutting down economic activities)
covid_data$esodo3 <- as.numeric(covid_data$date=="2020-03-22") #Third coming back of people from Northern Italy to the South (following the Ordinanza dei Ministeri della Salute e dell'Interno forbidding movements between Comuni and the DPCM shutting down further economic activities. Note that, as for Sicily, the number of people moving to the South has been lower by 70% than in previous exoduses)
plot(covid_data$date,covid_data$totale_positivi) #General plot (Italy and regions)
write.csv(covid_data,"covid_data.csv",row.names=F) #I save the dataframe as a .csv file. I added the 'row.names=F' option which became necessary to avoid generating an empty first column in the generated file (that column represents row names)
############################
############################
############################
