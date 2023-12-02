Base_Cat<-catnat_gaspar

Base_Val<-valeursfoncieres_2022




library(tidyverse)


Q2<-as.character(Base_Val$`Code commune`)
p2<-(nchar(Q2) ==1)
Base_Val$`Code commune`[which(p2)]<-str_c(Base_Val$`Code departement`[p2],str_c("00",Q2[p2]))
p<-(nchar(Q2) ==2)
Base_Val$`Code commune`[which(p)]<-str_c(Base_Val$`Code departement`[p],str_c("0",Q2[p]))

p1<-(nchar(Q2) ==3)
Base_Val$`Code commune`[which(p1)]<-str_c(Base_Val$`Code departement`[p1],Q2[p1])





as.data.frame(Base_Val+ 17)


#########modification Alphonse test



setwd("C:/Users/alpho/Desktop/Data visualisation 2023")


valeursfoncieres <- read.delim2("valeursfoncieres-2022.txt", header=TRUE, sep="|")

valeursfoncieres=as.data.frame(valeursfoncieres)
#valeursfoncieres[which(is.na(valeursfoncieres$Identifiant.de.document)),]

catnat_gaspar <- read.csv2("catnat_gaspar.csv") 

#View(valeursfoncieres)
#View(catnat_gaspar)


DVF=valeurs_foncieres
gaspar=gaspar_cat_nat


library(data.table)
library(dplyr)

######### CHALLENGE DATA VISUALISATION ##########

### Base DVF

#head(DVF)

#ajouter_zero_si_necessaire <- function(chaine) {
#  longueur <- nchar(chaine)
#  if (longueur == 1) {
#    return(paste0("00", chaine))
#  } else if (longueur == 2) {
#    return(paste0("0", chaine))
#  } else {
#    return(chaine)
#  }
#}

# Elle contient les infos relatives aux transactions immobilières survenues en France métropolitaine en 2022
# Variables à supprimer pour faciliter la manipulation de la base : 7 premières (toutes les valeurs sont NA)
DVF=DVF[,8:ncol(DVF)]

# Se limiter à l'étude des appartements et maisons (suggestion de l'institut de prioriser les biens privés)
DVF=DVF[(DVF$Code.type.local %in% c(1,2)),]
DVF$Code.commune=as.factor(DVF$Code.commune)

#summary(DVF) # On peut maintenant supprimer les variables Identifiant local (all NA),No Volume(all "")
DVF=select(DVF,-c(No.Volume,Identifiant.local))
#summary(DVF)
f=function(code){return(sprintf("%03d",as.numeric(code)))}
DVF$Code.commune=f(DVF$Code.commune)
DVF$cod_commune=paste0(DVF$Code.departement,DVF$Code.commune)
head(DVF)



### Base Gaspar

gaspar=gaspar[,-(8:10)]
gaspar$dat_deb = as.POSIXct(gaspar$dat_deb, format = "%Y-%m-%d %H:%M:%S")
gaspar$dat_fin = as.POSIXct(gaspar$dat_fin, format = "%Y-%m-%d %H:%M:%S")
head(gaspar)
### Fusion des deux bases

base = inner_join(gaspar,DVF,by = "cod_commune") # base qui ne conserve que les données des cod_commune communs

# Constat: Les quatre bases sont pareils
View(base)

colnames(gaspar)


###### tâche 1 : Alphonse : 

## analyses univariées 
#quantitatives : variable durées évènements : datin-date debut
#qualitatives : lib_risque_jO

colnames(base)

unique(base$lib_risque_jo)

### bivariées

##quanti-quali 

#val_fonc x commune
#val_fonc x type local

### ce sont juste des tests




