library(shiny)
library(mapview)
library(tmap)

library(shiny)
library(rnaturalearth)

library(bs4Dash)
library(shiny)
library(bs4Dash)
library(htmlwidgets)
library(slickR)
library(shinyalert)
library(DT)
library(dbscan)
library(shinycustomloader)
library(ggplot2)
library(igraph)
library(shinyWidgets)
library(bubblyr)
library(spsComps)
library(mailtoR)
library(rnaturalearth)
library(mapview)
library(leaflet)
library(magrittr)
library(rnaturalearth)
library(sf)
library(mapview)
library(dplyr)
library(leaflet)
library(rnaturalearth)
library(mapview)
library(tmap)
library(plotly)
library(ggplot2)
library(gganimate)
library(shiny)
library(rnaturalearth)
library(tidyverse)

dat<-str_split(base$dat_deb, "-",simplify=TRUE)
annee<-dat[,1]
Base<-cbind(base,annee)

# 54 Inondation dans toute la base
Base_54<- Base %>%
  filter(num_risque_jo %in% 54)
# 60
Base_60<-Base %>%
  filter(num_risque_jo %in% 60)

# 59
Base_59<-Base %>%
  filter(num_risque_jo %in% 59)
# 57
Base_57<-Base %>%
  filter(num_risque_jo %in% 57)


#### Base 54 uniquement inondation


Base_54<-Base_54[,c(21,32)]


## Function general 54


library(sf)

France1<-ne_states(country = "France", returnclass = "sf") %>% 
  filter(!name %in% c("Guyane française", "Martinique", "Guadeloupe", "La Réunion", "Mayotte"))
Fr<-str_split(France1$iso_3166_2, "-",simplify=TRUE)
France1$iso_3166_2<-Fr[,2]
France2<-as.data.frame(France1)
France3<-France2[-c(6,17,18,73),]




Inondation1<-list(NULL)
Inondation2<-list(NULL)
Inondation3<-list(NULL)
Base_54f<- function(i){ Base_54 %>%
    filter(annee %in% i)}
Base_59f<- function(i){ Base_59 %>%
    filter(annee %in% i)}
Base_60f<-function(i){ Base_60 %>%
    filter(annee %in% i)}

h<-France3$iso_3166_2
Ans<-sort(unique(annee))




for (i in 1:42) {

  
  hf<-Base_54f(Ans[i]) ## Nombre de inondation dans les departemeent dans l'an Ans[i]
  
  Nbre_Even<-NULL
  for (j in 1:length(h)) {
    Nbre_Even[j]<-sum(h[j]==hf$Code.departement)
  }
  
  Inondation1[[i]]<-Nbre_Even
  
}





for (i in 1:42) {
  
  hf<-Base_59f(Ans[i]) ## Nombre de inondation dans les departemeent dans l'an Ans[i]
  Nbre_Even<-NULL
  for (j in 1:length(h)) {
    Nbre_Even[j]<-sum(h[j]==hf$Code.departement)
  }
  Inondation2[[i]]<-Nbre_Even
  
}




for (i in 1:42) {
  
  hf<-Base_60f(Ans[i]) ## Nombre de MOUVEMENT DE TERRAIN dans les departemeent dans l'an Ans[i]
  
  Nbre_Even<-NULL
  for (j in 1:length(h)) {
    Nbre_Even[j]<-sum(h[j]==hf$Code.departement)
  }
  
  Inondation3[[i]]<-Nbre_Even
  
}


## Base de tous les inondation par ans de chq departeements ordre decroisant par ans ( fonction de l'orde de depaertement de france3)

















### Repartition des appartements et Maisons


Base1<-gaspar
Basel<-base$Type.local
Basel<-Basel[!is.na(Basel)]

# Supposons que votre dataframe s'appelle "Base"
Basel <- Basel[Basel %in% c("Maison", "Appartement") ]


datta<-data.frame(Basel)

datta$Basel <- factor(datta$Basel, levels = c("Maison", "Appartement"))
donut_chart <- plot_ly(datta, labels = ~Basel, type = 'pie', hole = 0.6,
                       textposition = "inside", textinfo = "label+percent") %>%
  layout(title = "Répartition des Biens (Maison/Appartement)",
         showlegend = FALSE,
         margin = list(l = 10, r = 10, b = 10, t = 50),
         font = list(family = "Arial, sans-serif", size = 14, color = "black"))

# Afficher le camembert interactif
donut_chart




