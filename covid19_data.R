############################
###SUBSETTING THE REGIONS###
############################
#In this section I create subsets of the dataframe, so that I can analyse regional data
#I also build interesting variables, such as the shares of contagions, deaths, etc.
options(scipen=999) #This will prevent scientific notation in plots' axes
setwd("~/github/covid_19_data")

italia <- subset(covid_data,covid_data$denominazione_regione=="Italia")
n <- length(italia$date) #convenient, because it represents the number of observations
italia$growth_tot <- c(0,diff(italia$totale_casi)/italia$totale_casi[1:n-1]) #Growth rate of total cases
italia$growth_ter_int <- c(0,diff(italia$terapia_intensiva)/italia$terapia_intensiva[1:n-1]) #Growth rate of intensive care
italia$nuovi_deceduti <- c(0,diff(italia$deceduti))
italia$growth_dec <- c(0,diff(italia$deceduti)/italia$deceduti[1:n-1]) #Growth rate of deceased

abruzzo <- subset(covid_data,covid_data$denominazione_regione=="Abruzzo")
abruzzo$growth_tot <- c(0,diff(abruzzo$totale_casi)/abruzzo$totale_casi[1:n-1]) #Growth rate of contagions
abruzzo$growth_ter_int <- c(0,diff(abruzzo$terapia_intensiva)/abruzzo$terapia_intensiva[1:n-1]) #Growth rate of intensive care
abruzzo$nuovi_deceduti <- c(0,diff(abruzzo$deceduti))
abruzzo$growth_dec <- c(0,diff(abruzzo$deceduti)/abruzzo$deceduti[1:n-1]) #Growth rate of deceased
abruzzo$share_tot <- abruzzo$totale_casi/italia$totale_casi
abruzzo$share_new <- abruzzo$nuovi_positivi/italia$nuovi_positivi
abruzzo$share_ter_int <- abruzzo$terapia_intensiva/italia$terapia_intensiva
abruzzo$share_dec <- abruzzo$deceduti/italia$deceduti

basilicata <- subset(covid_data,covid_data$denominazione_regione=="Basilicata")
basilicata$growth_tot <- c(0,diff(basilicata$totale_casi)/basilicata$totale_casi[1:n-1]) #Growth rate of contagions
basilicata$growth_ter_int <- c(0,diff(basilicata$terapia_intensiva)/basilicata$terapia_intensiva[1:n-1]) #Growth rate of intensive care
basilicata$nuovi_deceduti <- c(0,diff(basilicata$deceduti))
basilicata$growth_dec <- c(0,diff(basilicata$deceduti)/basilicata$deceduti[1:n-1]) #Growth rate of deceased
basilicata$share_tot <- basilicata$totale_casi/italia$totale_casi
basilicata$share_new <- basilicata$nuovi_positivi/italia$nuovi_positivi
basilicata$share_ter_int <- basilicata$terapia_intensiva/italia$terapia_intensiva
basilicata$share_dec <- basilicata$deceduti/italia$deceduti

calabria <- subset(covid_data,covid_data$denominazione_regione=="Calabria")
calabria$growth_tot <- c(0,diff(calabria$totale_casi)/calabria$totale_casi[1:n-1]) #Growth rate of contagions
calabria$growth_ter_int <- c(0,diff(calabria$terapia_intensiva)/calabria$terapia_intensiva[1:n-1]) #Growth rate of intensive care
calabria$nuovi_deceduti <- c(0,diff(calabria$deceduti))
calabria$growth_dec <- c(0,diff(calabria$deceduti)/calabria$deceduti[1:n-1]) #Growth rate of deceased
calabria$share_tot <- calabria$totale_casi/italia$totale_casi
calabria$share_new <- calabria$nuovi_positivi/italia$nuovi_positivi
calabria$share_ter_int <- calabria$terapia_intensiva/italia$terapia_intensiva
calabria$share_dec <- calabria$deceduti/italia$deceduti

campania <- subset(covid_data,covid_data$denominazione_regione=="Campania")
campania$growth_tot <- c(0,diff(campania$totale_casi)/campania$totale_casi[1:n-1]) #Growth rate of contagions
campania$growth_ter_int <- c(0,diff(campania$terapia_intensiva)/campania$terapia_intensiva[1:n-1]) #Growth rate of intensive care
campania$nuovi_deceduti <- c(0,diff(campania$deceduti))
campania$growth_dec <- c(0,diff(campania$deceduti)/campania$deceduti[1:n-1]) #Growth rate of deceased
campania$share_tot <- campania$totale_casi/italia$totale_casi
campania$share_new <- campania$nuovi_positivi/italia$nuovi_positivi
campania$share_ter_int <- campania$terapia_intensiva/italia$terapia_intensiva
campania$share_dec <- campania$deceduti/italia$deceduti

e_romagna <- subset(covid_data,covid_data$denominazione_regione=="Emilia-Romagna")
e_romagna$growth_tot <- c(0,diff(e_romagna$totale_casi)/e_romagna$totale_casi[1:n-1]) #Growth rate of contagions
e_romagna$growth_ter_int <- c(0,diff(e_romagna$terapia_intensiva)/e_romagna$terapia_intensiva[1:n-1]) #Growth rate of intensive care
e_romagna$nuovi_deceduti <- c(0,diff(e_romagna$deceduti))
e_romagna$growth_dec <- c(0,diff(e_romagna$deceduti)/e_romagna$deceduti[1:n-1]) #Growth rate of deceased
e_romagna$share_tot <- e_romagna$totale_casi/italia$totale_casi
e_romagna$share_new <- e_romagna$nuovi_positivi/italia$nuovi_positivi
e_romagna$share_ter_int <- e_romagna$terapia_intensiva/italia$terapia_intensiva
e_romagna$share_dec <- e_romagna$deceduti/italia$deceduti

fv_giulia <- subset(covid_data,covid_data$denominazione_regione=="Friuli Venezia Giulia")
fv_giulia$growth_tot <- c(0,diff(fv_giulia$totale_casi)/fv_giulia$totale_casi[1:n-1]) #Growth rate of contagions
fv_giulia$growth_ter_int <- c(0,diff(fv_giulia$terapia_intensiva)/fv_giulia$terapia_intensiva[1:n-1]) #Growth rate of intensive care
fv_giulia$nuovi_deceduti <- c(0,diff(fv_giulia$deceduti))
fv_giulia$growth_dec <- c(0,diff(fv_giulia$deceduti)/fv_giulia$deceduti[1:n-1]) #Growth rate of deceased
fv_giulia$share_tot <- fv_giulia$totale_casi/italia$totale_casi
fv_giulia$share_new <- fv_giulia$nuovi_positivi/italia$nuovi_positivi
fv_giulia$share_ter_int <- fv_giulia$terapia_intensiva/italia$terapia_intensiva
fv_giulia$share_dec <- fv_giulia$deceduti/italia$deceduti

lazio <- subset(covid_data,covid_data$denominazione_regione=="Lazio")
lazio$growth_tot <- c(0,diff(lazio$totale_casi)/lazio$totale_casi[1:n-1]) #Growth rate of contagions
lazio$growth_ter_int <- c(0,diff(lazio$terapia_intensiva)/lazio$terapia_intensiva[1:n-1]) #Growth rate of intensive care
lazio$nuovi_deceduti <- c(0,diff(lazio$deceduti))
lazio$growth_dec <- c(0,diff(lazio$deceduti)/lazio$deceduti[1:n-1]) #Growth rate of deceased
lazio$share_tot <- lazio$totale_casi/italia$totale_casi
lazio$share_new <- lazio$nuovi_positivi/italia$nuovi_positivi
lazio$share_ter_int <- lazio$terapia_intensiva/italia$terapia_intensiva
lazio$share_dec <- lazio$deceduti/italia$deceduti

liguria <- subset(covid_data,covid_data$denominazione_regione=="Liguria")
liguria$growth_tot <- c(0,diff(liguria$totale_casi)/liguria$totale_casi[1:n-1]) #Growth rate of contagions
liguria$growth_ter_int <- c(0,diff(liguria$terapia_intensiva)/liguria$terapia_intensiva[1:n-1]) #Growth rate of intensive care
liguria$nuovi_deceduti <- c(0,diff(liguria$deceduti))
liguria$growth_dec <- c(0,diff(liguria$deceduti)/liguria$deceduti[1:n-1]) #Growth rate of deceased
liguria$share_tot <- liguria$totale_casi/italia$totale_casi
liguria$share_new <- liguria$nuovi_positivi/italia$nuovi_positivi
liguria$share_ter_int <- liguria$terapia_intensiva/italia$terapia_intensiva
liguria$share_dec <- liguria$deceduti/italia$deceduti

lombardia <- subset(covid_data,covid_data$denominazione_regione=="Lombardia")
lombardia$growth_tot <- c(0,diff(lombardia$totale_casi)/lombardia$totale_casi[1:n-1]) #Growth rate of contagions
lombardia$growth_ter_int <- c(0,diff(lombardia$terapia_intensiva)/lombardia$terapia_intensiva[1:n-1]) #Growth rate of intensive care
lombardia$nuovi_deceduti <- c(0,diff(lombardia$deceduti))
lombardia$growth_dec <- c(0,diff(lombardia$deceduti)/lombardia$deceduti[1:n-1]) #Growth rate of deceased
lombardia$share_tot <- lombardia$totale_casi/italia$totale_casi
lombardia$share_new <- lombardia$nuovi_positivi/italia$nuovi_positivi
lombardia$share_ter_int <- lombardia$terapia_intensiva/italia$terapia_intensiva
lombardia$share_dec <- lombardia$deceduti/italia$deceduti

marche <- subset(covid_data,covid_data$denominazione_regione=="Marche")
marche$growth_tot <- c(0,diff(marche$totale_casi)/marche$totale_casi[1:n-1]) #Growth rate of contagions
marche$growth_ter_int <- c(0,diff(marche$terapia_intensiva)/marche$terapia_intensiva[1:n-1]) #Growth rate of intensive care
marche$nuovi_deceduti <- c(0,diff(marche$deceduti))
marche$growth_dec <- c(0,diff(marche$deceduti)/marche$deceduti[1:n-1]) #Growth rate of deceased
marche$share_tot <- marche$totale_casi/italia$totale_casi
marche$share_new <- marche$nuovi_positivi/italia$nuovi_positivi
marche$share_ter_int <- marche$terapia_intensiva/italia$terapia_intensiva
marche$share_dec <- marche$deceduti/italia$deceduti

molise <- subset(covid_data,covid_data$denominazione_regione=="Molise")
molise$growth_tot <- c(0,diff(molise$totale_casi)/molise$totale_casi[1:n-1]) #Growth rate of contagions
molise$growth_ter_int <- c(0,diff(molise$terapia_intensiva)/molise$terapia_intensiva[1:n-1]) #Growth rate of intensive care
molise$nuovi_deceduti <- c(0,diff(molise$deceduti))
molise$growth_dec <- c(0,diff(molise$deceduti)/molise$deceduti[1:n-1]) #Growth rate of deceased
molise$share_tot <- molise$totale_casi/italia$totale_casi
molise$share_new <- molise$nuovi_positivi/italia$nuovi_positivi
molise$share_ter_int <- molise$terapia_intensiva/italia$terapia_intensiva
molise$share_dec <- molise$deceduti/italia$deceduti

bolzano <- subset(covid_data,covid_data$denominazione_regione=="P.A. Bolzano")
bolzano$growth_tot <- c(0,diff(bolzano$totale_casi)/bolzano$totale_casi[1:n-1]) #Growth rate of contagions
bolzano$growth_ter_int <- c(0,diff(bolzano$terapia_intensiva)/bolzano$terapia_intensiva[1:n-1]) #Growth rate of intensive care
bolzano$nuovi_deceduti <- c(0,diff(bolzano$deceduti))
bolzano$growth_dec <- c(0,diff(bolzano$deceduti)/bolzano$deceduti[1:n-1]) #Growth rate of deceased
bolzano$share_tot <- bolzano$totale_casi/italia$totale_casi
bolzano$share_new <- bolzano$nuovi_positivi/italia$nuovi_positivi
bolzano$share_ter_int <- bolzano$terapia_intensiva/italia$terapia_intensiva
bolzano$share_dec <- bolzano$deceduti/italia$deceduti

trento <- subset(covid_data,covid_data$denominazione_regione=="P.A. Trento")
trento$growth_tot <- c(0,diff(trento$totale_casi)/trento$totale_casi[1:n-1]) #Growth rate of contagions
trento$growth_ter_int <- c(0,diff(trento$terapia_intensiva)/trento$terapia_intensiva[1:n-1]) #Growth rate of intensive care
trento$nuovi_deceduti <- c(0,diff(trento$deceduti))
trento$growth_dec <- c(0,diff(trento$deceduti)/trento$deceduti[1:n-1]) #Growth rate of deceased
trento$share_tot <- trento$totale_casi/italia$totale_casi
trento$share_new <- trento$nuovi_positivi/italia$nuovi_positivi
trento$share_ter_int <- trento$terapia_intensiva/italia$terapia_intensiva
trento$share_dec <- trento$deceduti/italia$deceduti

piemonte <- subset(covid_data,covid_data$denominazione_regione=="Piemonte")
piemonte$growth_tot <- c(0,diff(piemonte$totale_casi)/piemonte$totale_casi[1:n-1]) #Growth rate of contagions
piemonte$growth_ter_int <- c(0,diff(piemonte$terapia_intensiva)/piemonte$terapia_intensiva[1:n-1]) #Growth rate of intensive care
piemonte$nuovi_deceduti <- c(0,diff(piemonte$deceduti))
piemonte$growth_dec <- c(0,diff(piemonte$deceduti)/piemonte$deceduti[1:n-1]) #Growth rate of deceased
piemonte$share_tot <- piemonte$totale_casi/italia$totale_casi
piemonte$share_new <- piemonte$nuovi_positivi/italia$nuovi_positivi
piemonte$share_ter_int <- piemonte$terapia_intensiva/italia$terapia_intensiva
piemonte$share_dec <- piemonte$deceduti/italia$deceduti

puglia <- subset(covid_data,covid_data$denominazione_regione=="Puglia")
puglia$growth_tot <- c(0,diff(puglia$totale_casi)/puglia$totale_casi[1:n-1]) #Growth rate of contagions
puglia$growth_ter_int <- c(0,diff(puglia$terapia_intensiva)/puglia$terapia_intensiva[1:n-1]) #Growth rate of intensive care
puglia$nuovi_deceduti <- c(0,diff(puglia$deceduti))
puglia$growth_dec <- c(0,diff(puglia$deceduti)/puglia$deceduti[1:n-1]) #Growth rate of deceased
puglia$share_tot <- puglia$totale_casi/italia$totale_casi
puglia$share_new <- puglia$nuovi_positivi/italia$nuovi_positivi
puglia$share_ter_int <- puglia$terapia_intensiva/italia$terapia_intensiva
puglia$share_dec <- puglia$deceduti/italia$deceduti

sardegna <- subset(covid_data,covid_data$denominazione_regione=="Sardegna")
sardegna$growth_tot <- c(0,diff(sardegna$totale_casi)/sardegna$totale_casi[1:n-1]) #Growth rate of contagions
sardegna$growth_ter_int <- c(0,diff(sardegna$terapia_intensiva)/sardegna$terapia_intensiva[1:n-1]) #Growth rate of intensive care
sardegna$nuovi_deceduti <- c(0,diff(sardegna$deceduti))
sardegna$growth_dec <- c(0,diff(sardegna$deceduti)/sardegna$deceduti[1:n-1]) #Growth rate of deceased
sardegna$share_tot <- sardegna$totale_casi/italia$totale_casi
sardegna$share_new <- sardegna$nuovi_positivi/italia$nuovi_positivi
sardegna$share_ter_int <- sardegna$terapia_intensiva/italia$terapia_intensiva
sardegna$share_dec <- sardegna$deceduti/italia$deceduti

sicilia <- subset(covid_data,covid_data$denominazione_regione=="Sicilia")
sicilia$growth_tot <- c(0,diff(sicilia$totale_casi)/sicilia$totale_casi[1:n-1]) #Growth rate of contagions
sicilia$growth_ter_int <- c(0,diff(sicilia$terapia_intensiva)/sicilia$terapia_intensiva[1:n-1]) #Growth rate of intensive care
sicilia$nuovi_deceduti <- c(0,diff(sicilia$deceduti))
sicilia$growth_dec <- c(0,diff(sicilia$deceduti)/sicilia$deceduti[1:n-1]) #Growth rate of deceased
sicilia$share_tot <- sicilia$totale_casi/italia$totale_casi
sicilia$share_new <- sicilia$nuovi_positivi/italia$nuovi_positivi
sicilia$share_ter_int <- sicilia$terapia_intensiva/italia$terapia_intensiva
sicilia$share_dec <- sicilia$deceduti/italia$deceduti

toscana <- subset(covid_data,covid_data$denominazione_regione=="Toscana")
toscana$growth_tot <- c(0,diff(toscana$totale_casi)/toscana$totale_casi[1:n-1]) #Growth rate of contagions
toscana$growth_ter_int <- c(0,diff(toscana$terapia_intensiva)/toscana$terapia_intensiva[1:n-1]) #Growth rate of intensive care
toscana$nuovi_deceduti <- c(0,diff(toscana$deceduti))
toscana$growth_dec <- c(0,diff(toscana$deceduti)/toscana$deceduti[1:n-1]) #Growth rate of deceased
toscana$share_tot <- toscana$totale_casi/italia$totale_casi
toscana$share_new <- toscana$nuovi_positivi/italia$nuovi_positivi
toscana$share_ter_int <- toscana$terapia_intensiva/italia$terapia_intensiva
toscana$share_dec <- toscana$deceduti/italia$deceduti

umbria <- subset(covid_data,covid_data$denominazione_regione=="Umbria")
umbria$growth_tot <- c(0,diff(umbria$totale_casi)/umbria$totale_casi[1:n-1]) #Growth rate of contagions
umbria$growth_ter_int <- c(0,diff(umbria$terapia_intensiva)/umbria$terapia_intensiva[1:n-1]) #Growth rate of intensive care
umbria$nuovi_deceduti <- c(0,diff(umbria$deceduti))
umbria$growth_dec <- c(0,diff(umbria$deceduti)/umbria$deceduti[1:n-1]) #Growth rate of deceased
umbria$share_tot <- umbria$totale_casi/italia$totale_casi
umbria$share_new <- umbria$nuovi_positivi/italia$nuovi_positivi
umbria$share_ter_int <- umbria$terapia_intensiva/italia$terapia_intensiva
umbria$share_dec <- umbria$deceduti/italia$deceduti

v_aosta <- subset(covid_data,covid_data$denominazione_regione=="Valle d'Aosta")
v_aosta$growth_tot <- c(0,diff(v_aosta$totale_casi)/v_aosta$totale_casi[1:n-1]) #Growth rate of contagions
v_aosta$growth_ter_int <- c(0,diff(v_aosta$terapia_intensiva)/v_aosta$terapia_intensiva[1:n-1]) #Growth rate of intensive care
v_aosta$nuovi_deceduti <- c(0,diff(v_aosta$deceduti))
v_aosta$growth_dec <- c(0,diff(v_aosta$deceduti)/v_aosta$deceduti[1:n-1]) #Growth rate of deceased
v_aosta$share_tot <- v_aosta$totale_casi/italia$totale_casi
v_aosta$share_new <- v_aosta$nuovi_positivi/italia$nuovi_positivi
v_aosta$share_ter_int <- v_aosta$terapia_intensiva/italia$terapia_intensiva
v_aosta$share_dec <- v_aosta$deceduti/italia$deceduti

veneto <- subset(covid_data,covid_data$denominazione_regione=="Veneto")
veneto$growth_tot <- c(0,diff(veneto$totale_casi)/veneto$totale_casi[1:n-1]) #Growth rate of contagions
veneto$growth_ter_int <- c(0,diff(veneto$terapia_intensiva)/veneto$terapia_intensiva[1:n-1]) #Growth rate of intensive care
veneto$nuovi_deceduti <- c(0,diff(veneto$deceduti))
veneto$growth_dec <- c(0,diff(veneto$deceduti)/veneto$deceduti[1:n-1]) #Growth rate of deceased
veneto$share_tot <- veneto$totale_casi/italia$totale_casi
veneto$share_new <- veneto$nuovi_positivi/italia$nuovi_positivi
veneto$share_ter_int <- veneto$terapia_intensiva/italia$terapia_intensiva
veneto$share_dec <- veneto$deceduti/italia$deceduti
############################
############################
############################


############################
###REPRESENTING VARIABLES###
####OF INTEREST AS TABLES###
############################
#Time series of total contagions
"Abruzzo" <- abruzzo$totale_positivi
"Basilicata" <- basilicata$totale_positivi
"Calabria" <- calabria$totale_positivi         
"Campania" <- campania$totale_positivi
"Emilia_Romagna" <- e_romagna$totale_positivi
"Friuli_Venezia_Giulia" <- fv_giulia$totale_positivi
"Lazio" <- lazio$totale_positivi
"Liguria" <- liguria$totale_positivi
"Lombardia" <- lombardia$totale_positivi
"Marche" <- marche$totale_positivi
"Molise" <- molise$totale_positivi
"P.A._Bolzano" <- bolzano$totale_positivi
"P.A._Trento" <- trento$totale_positivi
"Piemonte" <- piemonte$totale_positivi
"Puglia" <- puglia$totale_positivi
"Sardegna" <- sardegna$totale_positivi
"Sicilia" <- sicilia$totale_positivi
"Toscana" <- toscana$totale_positivi
"Umbria" <- umbria$totale_positivi
"Valle_d_Aosta" <- v_aosta$totale_positivi
"Veneto" <- veneto$totale_positivi
"Italia" <- italia$totale_positivi
ts_tot_positivi <- write.csv(cbind(date,Abruzzo,Basilicata,Calabria,Campania,Emilia_Romagna,
                                   Friuli_Venezia_Giulia,Lazio,Liguria,Lombardia,Marche,Molise,
                                   P.A._Bolzano,P.A._Trento,Piemonte,Puglia,Sardegna,Sicilia,
                                   Toscana,Umbria,Valle_d_Aosta,Veneto,Italia),"ts_tot_positivi.csv")

#Latest observation of contagions (reproducing the table from Ministero della Salute: )
Data <- as.vector(italia$date)[length(italia$date)]
Regione <- as.vector(append(regions,"Italia"))
latest_abruzzo <- abruzzo[n,c(4,11,14,15,16,17)]
latest_basilicata <- basilicata[n,c(4,11,14,15,16,17)]
latest_calabria <- calabria[n,c(4,11,14,15,16,17)]
latest_campania <- campania[n,c(4,11,14,15,16,17)]
latest_e_romagna <- e_romagna[n,c(4,11,14,15,16,17)]
latest_fv_giulia <- fv_giulia[n,c(4,11,14,15,16,17)]
latest_lazio <- lazio[n,c(4,11,14,15,16,17)]
latest_liguria <- liguria[n,c(4,11,14,15,16,17)]
latest_lombardia <- lombardia[n,c(4,11,14,15,16,17)]
latest_marche <- marche[n,c(4,11,14,15,16,17)]
latest_molise <- molise[n,c(4,11,14,15,16,17)]
latest_bolzano <- bolzano[n,c(4,11,14,15,16,17)]
latest_trento <- trento[n,c(4,11,14,15,16,17)]
latest_piemonte <- piemonte[n,c(4,11,14,15,16,17)]
latest_puglia <- puglia[n,c(4,11,14,15,16,17)]
latest_sardegna <- sardegna[n,c(4,11,14,15,16,17)]
latest_sicilia <- sicilia[n,c(4,11,14,15,16,17)]
latest_toscana <- toscana[n,c(4,11,14,15,16,17)]
latest_umbria <- umbria[n,c(4,11,14,15,16,17)]
latest_v_aosta <- v_aosta[n,c(4,11,14,15,16,17)]
latest_veneto <- veneto[n,c(4,11,14,15,16,17)]
latest_italia <- italia[n,c(4,11,14,15,16,17)]
latest1 <- rbind(latest_abruzzo,latest_basilicata,latest_calabria,latest_campania,latest_e_romagna,
                 latest_fv_giulia,latest_lazio,latest_liguria,latest_lombardia,latest_marche,latest_molise,
                 latest_bolzano,latest_trento,latest_piemonte,latest_puglia,latest_sardegna,latest_sicilia,
                 latest_toscana,latest_umbria,latest_v_aosta,latest_veneto,latest_italia)
write.csv(cbind(date[n],latest1[order(latest1$totale_casi),]),"tab_prot_civile.csv")
############################
############################
############################

###Analysis of the data for Italy###
###Comparing the curve of total cases in Italy to an exponential curve
x <- c(1:length(italia$date))
plot(totale_casi~x,italia,type="l",col="black",xlab="Data",ylab="Numero casi di COVID-19",main="Curva dei casi di Coronavirus (COVID-19) in Italia")
lines(x^3.3) #Exponential compatible with the Italian curve

###Components of total cases - Lines
jpeg('totale_casi.jpg')
marks <- c(0,20000,50000,100000) #These are marks that I want to force in the y axis instead of the defaults drawn by R
plot(totale_casi~date,italia,type="l",col="#0033CC",yaxt="n",xlab="Data",ylab="Numero casi di COVID-19",main="Curva dei casi di Coronavirus (COVID-19) in Italia")
axis(2,at=marks,labels=marks) #The axis function draws the marks and labels that I have set before
abline(h=c(0,20000,50000,100000),v=italia$date[c(14,19,28)],col=c("grey")) #Horizontal lines where the marks are drawn, and vertical ones for specific dates
lines(totale_positivi~date,italia,type="l",pch=20,col="#CC0099")
lines(dimessi_guariti~date,italia,type="l",pch=1,col="#009933")
lines(deceduti~date,italia,type="l",pch=20,col="#CC0000")
legend("topleft",legend=c("Totale casi","Totale positivi","Guariti","Deceduti"),col=c("#0033CC","#CC0099","#009933","#CC0000"),box.lty=0,lty=1,cex=0.6,inset=c(0.01,0.01)) #Adding a legend without visible box (the legend is drawn in the top-left corner of the graph region and it is displaced to the right and centre by 0.01 (the inset() option))
dev.off()

###Components of total cases - Barplot + line
#Here the bars are stacked, so that the final height represents the number of total cases (and I draw the relative line to mark it)
barplot(as.matrix(italia[,c(11,14,15)])~date,xlab="Data",ylab="Numero casi di COVID-19",main="Curva dei casi di Coronavirus (COVID-19) in Italia") #I treat the data of interest as a matrix, because it allows me to draw a stacked barplot)
barplot_casi <- barplot(as.matrix(italia[,c(14,15,11)])~italia$date,xaxt="n",xlab="Data",ylab="Numero casi di COVID-19",main="Curva dei casi di Coronavirus (COVID-19) in Italia") #I treat the data of interest as a matrix, because it allows me to draw a stacked barplot). I also give the barplot a name so that I can use it afterwards, to draw the juxtaposed line over the correct bars in the barplot
lines(x=barplot_casi,y=italia$totale_casi)
axis(1,at=utili,labels=italia$date[utili])

###Deaths, intensive care and recoverings
jpeg('guariti_deceduti.jpg')
marks <- c(0,5000,10000,15000) #These are marks that I want to force in the y axis instead of the defaults drawn by R
plot(terapia_intensiva~date,italia,type="l",col="#FF6633",ylim=c(0,max(italia$dimessi_guariti)),xlab="Data",ylab="",main="Curve di ricoverati in terapia intensiva, \nguariti e morti di Coronavirus (COVID-19) in Italia")
axis(2,at=marks,labels=marks) #The axis function draws the marks and labels that I have set before
abline(h=c(0,5000,10000,15000),v=italia$date[c(7,21,38)],col=c("grey")) #Horizontal lines where the marks are drawn, and vertical ones for specific dates
lines(dimessi_guariti~date,italia,type="l",pch=20,col="#009933")
lines(deceduti~date,italia,type="l",pch=20,col="#CC0000")
legend("topleft",legend=c("Terapia intensiva","Guariti","Deceduti"),col=c("#FF6633","#009933","#CC0000"),box.lty=0,lty=1,cex=0.6,inset=c(0.01,0.01)) #Adding a legend without visible box (the legend is drawn in the top-left corner of the graph region and it is displaced to the right and centre by 0.01 (the inset() option))
dev.off()

plot(totale_positivi~date,italia,type="l",col="#FF6633",ylim=c(0,max(italia$totale_positivi)),xlab="Data",ylab="",main="Curve di ricoverati in terapia intensiva, \nguariti e morti di Coronavirus (COVID-19) in Italia")


plot(growth_it,type="l")
plot(nuovi_positivi~date,italia,type="l")
plot(terapia_intensiva~date,italia,type="l")
plot(deceduti~date,italia,type="l")

plot(ts(italia$totale_positivi,1,length(levels(italia$date_new)))) #Italy: plot of total contagions treating the data as time series
plot(ts(italia$nuovi_positivi,1,length(levels(italia$date_new)))) #Italy: plot of new contagions treating the data as time series
growth_it <- diff(italia$totale_positivi)/italia$totale_positivi[1:(length(italia$totale_positivi)-1)] #Growth rate of contagions
plot(growth_it,type="l")
plot(italia$deceduti,type="l") #Italy: plot of deceased
plot(growth_d_it,type="l")
share_ic <- round(italia$terapia_intensiva/italia$totale_positivi,2) #Persons in intensive care as a percentage of total contagions (also counting deaths)
plot(share_ic,type="l")


#Regional data analysis
regions <- levels(covid_reg$denominazione_regione)

#Comparing actual contagions in various regions 
plot(totale_positivi~date,italia,type="b",pch=20,col="green",ylim=c(0,90000),ylab=("Attualmente contagiati"),xlab="Data")
lines(totale_positivi~date,lombardia,type="b",pch=10,col="red")
lines(totale_positivi~date,veneto,type="b",pch=1,col="orange")
lines(totale_positivi~date,e_romagna,type="b",pch="*",col="black")
lines(totale_positivi~date,sicilia,type="b",pch=18,col="blue")
grid(nx=NA,ny=NULL,col="light grey",lty=1)
abline(h=latest_italia$totale_positivi,col="purple")

#Comparing total contagions in various regions 
plot(totale_casi~date,italia,type="b",pch=20,col="green",ylim=c(0,100000),ylab=("Totale casi"),xlab="Data")
lines(totale_casi~date,lombardia,type="b",pch=10,col="red")
lines(totale_casi~date,veneto,type="b",pch=1,col="orange")
lines(totale_casi~date,e_romagna,type="b",pch="*",col="black")
lines(totale_casi~date,sicilia,type="b",pch=18,col="blue")
grid(nx=NA,ny=NULL,col="light grey",lty=1)
abline(h=latest_italia$totale_casi,col="purple")

#Comparing the growth rate of contagions in various regions
plot(growth_it,type="b",pch=20,col="green")
abline(h=mean(growth_it),lty=3) #dotted line at the mean growth of contagions
lines(growth_lom,type="b",pch=10,col="red")
lines(growth_ven,type="b",pch=1,col="orange")
lines(growth_erom,type="b",pch="*",col="black")
lines(growth_sic,type="b",pch=18,col="blue")
grid(nx=NA,ny=NULL,col="light grey",lty=1)


table(sicilia$totale_positivi)
plot(ts(lombardia$totale_positivi,1,length(levels(italia$date_new)))) #Lombardia plot treating the data as time series
plot(ts(lombardia$nuovi_positivi,1,length(levels(italia$date_new)))) #Lombardia plot treating the data as time series

