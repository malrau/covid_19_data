############################
####BUILDING THE DATASET####
############################
options(scipen=999) #This will prevent scientific notation in plots' axes
setwd("~/github/covid_19_data")
covid_ita1 <- read.delim("dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv",sep=",",header=T) #This is the file containing the data for the whole country. I use it as data frame
new_columns <- data.frame(codice_regione=0,denominazione_regione="Italia",lat=41.8719,long=12.5674) #These columns are present in the file containing the data for the Italian regions.
covid_ita2 <- cbind(covid_ita1,new_columns) #I attach them here too, because otherwise I would have problems merging the two datasets
covid_ita3 <- covid_ita2[,c(1,2,16,17,18,19,3,4,5,6,7,8,9,10,11,12,13)] #Here I put the columns in the correct order (the same order as for the regional data frame) and I remove the new variables "note_it" and "note_en"
str(covid_ita3) #the "data" and "stato" variables are factors. I need to convert the "data" variable in date format.
date <- as.Date(covid_ita1$data,format="%Y-%m-%d")
covid_ita4 <- covid_ita3[,2:(length(covid_ita3))] #I remove the old date variable from the data frame
covid_ita <- cbind(date,covid_ita4) #I replace the date variable with the new one in the correct format
plot(covid_ita$date,covid_ita$totale_casi,type="l",cex.axis=.7,xlab="Data",ylab="Totale casi in Italia")
covid_reg1 <- read.delim("dati-regioni/dpc-covid19-ita-regioni.csv",sep=",",header=T) #Here I load the regional data frame. I already know I have to substitute the date variable with the one in date format.
covid_reg2 <- covid_reg1[order(covid_reg1$codice_regione),] #Since the regional data are ordered by date, not region code, before merging the two data frames I have to change the way in which the regional data are ordered
covid_reg3 <- covid_reg2[,2:(length(covid_reg1)-2)] #Here I remove the date and notes variables, same as I did for the Italian data
covid_reg <- cbind(date,covid_reg3)
names(covid_ita)
names(covid_reg)
covid_data <- rbind(covid_ita,covid_reg) #Here I merge the two datasets
covid_data$mortalità <- covid_data$deceduti/covid_data$totale_casi #Mortality rate
covid_data$nuovi_tamponi <- covid_data$nuovi_positivi/covid_data$tamponi #Capacity of tampoons to signal the increase of contagions
covid_data$mado <- as.numeric(italia$date=="2020-03-07") #People from Madonna di Casmpiglio to Messina
covid_data$esodo1 <- as.numeric(italia$date=="2020-03-08") #First coming back of people from Northern Italy to the South (following the DPCM rendering Lombardia and fourteen provinces from Piemonte, Veneto, Emilia Romagna and Marche "Zona rossa")
covid_data$esodo2 <- as.numeric(italia$date=="2020-03-13") #Second coming back of people from Northern Italy to the South (following the DPCM rendering the whole country "Zona rossa" and shutting down economic activities)
covid_data$esodo3 <- as.numeric(italia$date=="2020-03-22") #Third coming back of people from Northern Italy to the South (following the Ordinanza dei Ministeri della Salute e dell'Interno forbidding movements between Comuni and the DPCM shutting down further economic activities. Note that, as for Sicily, the number of people moving to the South has been lower by 70% than in previous exoduses)
plot(covid_data$date,covid_data$totale_positivi) #General plot (Italy and regions)
write.csv(covid_data,"covid_data.csv",row.names=F) #I save the dataframe as a .csv file
############################
############################
############################
