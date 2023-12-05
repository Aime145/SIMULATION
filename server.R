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

  
 

In<-reactive({Choix_Events(input$Choix)})  
Inondationn <- reactive({
  France4$Aime<-In()[[input$slider-1980]]
  st_as_sf(France4) })

output$mymap <- renderTmap({
  
  
  tm_basemap("Stamen.Watercolor") +
    tm_shape(Inondationn()) +
    tm_fill(col ="Aime" , palette = "Blues", alpha = 0.8) +
    tm_borders("white", lwd = 1)
 

})




}













