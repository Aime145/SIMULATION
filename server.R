#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(shiny)
library(mapview)
library(tmap)

library(shiny)
library(rnaturalearth)
library(shiny)
library(mapview)
library(ggplot2)
library(sp)
library(gstat)
library(RMySQL)
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

library(shiny)
library(rnaturalearth)



server <- function(input, output, session){
# Define server logic required to draw a histogram

  
  Inond<-numeric(92)
  France4<-cbind(France3,Inond)
  names(France4)[123] <- "Aime"
inond1<-reactive({ 
  if(input$Choix==1){
    Inondation<-Inondation1
  }
  if(input$Choix==2){
    Inondation<-Inondation2
  }
  if(input$Choix==3){
    Inondation<-Inondation3
  }
  France4$Aime<-Inondation[[input$slider-1980]]
  st_as_sf(France4)
})  
  

output$mymap <- renderTmap({
  
  
  tm_basemap("Stamen.Watercolor") +
    tm_shape(inond1()) +
    tm_fill(col ="Aime" , palette = "Blues", alpha = 0.8) +
    tm_borders("white", lwd = 1)
 

})


# output$Alpho<-renderPlotly(
#   ggplotly(ggplot(data = base, aes(x = " ", y = duree_evenements_en_jours)) +
#              geom_violin(fill = "purple") +
#              labs(title = "Repartition de la duree des evenements",
#                   y = "Duree (jours)")+
#              theme(axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank())
#   )
#   
# )



################ Titre 2 partie carte


# Mise à jour des choix de département en fonction du risque sélectionné


# observe({
#   risque_choisi <- ifelse(input$Risque==1,54,ifelse(input$Risque==2,59,60))
#   top_departements <- ifelse(input$Risque==1,Saliou_54,ifelse(input$Risque==2,Saliou_59,Saliou_60))
#   updateSelectInput(session, "Code.departement", choices = top_departements$Code.departement)
# })
# 
# # Affichage du graphique
# output$sinistrePlot <- renderPlot({
#   risque_choisi <- ifelse(input$Risque==1,54,ifelse(input$Risque==2,59,60))
#   departement_choisi <- input$Code.departement
#   
#   data_filtree <- Base %>%
#     filter(num_risque_jo == risque_choisi, Code.departement == departement_choisi) %>%
#     group_by(annee) %>%
#     summarise(Nombre_Sinistres = n())
#   
#   ggplot(data_filtree, aes(x = annee, y = Nombre_Sinistres)) +
#     geom_line(color = "#0073C2FF") +
#     geom_point(color = "#EFC000FF", size = 3) +
#     theme_minimal(base_family = "Arial") +
#     labs(title = paste("Évolution des Sinistres pour le département", departement_choisi, "et risque", risque_choisi),
#          x = "Année",
#          y = "Nombre de Sinistres") +
#     theme(plot.title = element_text(color = "darkblue", size = 14, face = "bold"),
#           axis.title.x = element_text(color = "darkgreen"),
#           axis.title.y = element_text(color = "darkgreen"))
# })














Basse<-head(base,6)
output$data1 = renderDT(
  Basse[,1:5]
)

output$data2 = renderDT(
  Basse[,6:10]
)

output$data3 = renderDT(
  Basse[,11:15]
)

output$data4 = renderDT(
  Basse[,16:20]
)

output$data5 = renderDT(
  Basse[,21:25]
)

output$data6 = renderDT(
  Basse[,26:31]
)






}













