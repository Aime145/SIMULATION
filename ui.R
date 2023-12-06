#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

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
library(DT)
library(shiny)
library(rnaturalearth)

ui <- dashboardPage(
  header = dashboardHeader(rightUi = userOutput("user"),span(h2("ViZuData++"),style="color:gold") %>%
                             animateAppendNested("horizontal")
                           ,
                           title =dashboardBrand(
                             title =em("VizuData++"),
                             color = "primary",
                             href = "welcome",
                             image = welco
                           )
  ),
  sidebar = dashboardSidebar(
    
    
    
    sidebarUserPanel(
      
      image = welcogif,
      name = h4(span(em("Hi Visiteur!",style="color:Grey"))) %>%
        animateAppendNested("tada")
    ),
    sidebarMenu(
      
      menuItem("TER",tabName = "tp1",icon =icon("fal fa-wallet")),hr(),
      numericInput("Nbreind",icon("fas fa-users"),min = 1, value = " "),hr(),
      menuItem(strong("Data / Graphe"),tabName = "tp5",icon = icon("fas fa-eye-slash")),hr(),br(),br(),br(),br(),hr(),
      menuItem(strong("A-Propos"),tabName = "tp3",icon = icon("fas fa-info")),hr(),
      menuItem(strong("Questions"),tabName = "tp2",icon = icon("fas fa-question"))
    )
    
    
    
    
  ),
  
  
  
  
  body<-dashboardBody(useShinyalert(),
                      tabItems(
                        
                        tabItem(
                          tabName = "tp1",
                          fluidRow( 
                            column(12,
                                   tabBox(width = NULL,
                                          tabPanel(h5(strong("Accueil")) ,hr(),
                                                   fluidRow(
                                                     column(1),
                                                     column(10,
                                                            callout(width = 15,title=" ",
                                                                    elevation = 4,
                                                                    status = "success",
                                                                    sli2<- slickR(obj =c(l11,l2,acceuill2,acceuill3,acceuill4),height = 480, width = "95%") + 
                                                                      settings(dots = TRUE, autoplay = TRUE,autoplaySpeed = 1200,adaptiveHeight = TRUE)
                                                                    
                                                                    
                                                            )
                                                            
                                                     ),column(1)
                                                     
                                                     
                                                   ),fluidRow(
                                                     column(12,br(),br(),
                                                            hr(),p(),br(),span(h2("Présentations", class = "text-primary"),style="color:Grey") %>%
                                                              animateAppendNested("pulse"),br(),br(),p(test1,br(titre),br(titree),h6(soustitre1, class = "text-primary") %>%
                                                                                                         animateAppendNested("tada"),br(),br(),h6(soustitre2, class = "text-primary") %>%
                                                                                                         animateAppendNested("tada")),h6(soutritre4, class = "text-primary") %>%
                                                              animateAppendNested("tada"),
                                                            br(),br(),br(),br(),soustitre3)
                                                   ) 
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                          ),
                                          
                                          
                                          
                                          
                                          tabPanel(h5(strong("Présentation")), ### iCI C'EST POUR LA CARTE DE FRANCE (INPUT)
                                                     
                                                 fluidRow(
                                                       box(title = " Sous Titre","Pour réaliser ce projet, nous nous sommes servis de 2 bases de données",br(),
                                                           span(h6("-	Gaspar : https://www.data.gouv.fr/fr/datasets/r/d6fb9e18-b66b-499c-8284-46a3595579cc", class = "text-primary"),style="color:Grey"), br(),span(h6("-	DVF : https://www.data.gouv.fr/fr/datasets/r/87038926-fb31-4959-b2ae-7a24321c599a", class = "text-primary"),style="color:Grey"),
                                                       
                                                       "La base Gaspar regroupe des informations sur des catastrophes naturelles (catnat) telles que le type de catnat, les communes exposées ou encore les dates de début et de fin des catnat.
                                                       La base DVF quant à elle contient des informations relatives aux transactions immobilières survenues en France métropolitaine en 2022 (les communes dans lesquelles elles ont eu lieu, le type de transaction, la valeur foncière…etc).",br(),br(),
                                                       "Au départ, les bases Gaspar et DVF contiennent respectivement 253 991 et 4 617 590 lignes avec plus de 40 variables pour la base DVF. On peut également constater un nombre important de valeurs manquantes.
                                                       Notre objectif étant de fusionner ces
                                                       2 bases, et pour des raisons opérationnelles susmentionnées, nous devons nettoyer les données et restreindre les variables à celles nécessaires pour nos travaux futurs.",br(),br(),
                                                       
                                                       
                                                           width=12)
                                                       
                                                       
                                                     ),fluidRow(
                                                       column(6,
                                                       box(title = strong(h4(" Traitement de la base GASPAR"))  , 
                                                           "-	Nous avons décidé de ne conserver que les dates de début et de fin des catastrophes naturelles, pour lesquelles nous avons modifié le format (JJ-MM-AA) pour mieux les exploiter.",br(),hr(),
                                                          " -	Nous avons créé deux nouvelles variables « mois » et « saison » basées sur la variable date de début et qui représentent respectivement le mois dans lequel débute une catastrophe et la saison associée.",br(),hr(),
                                                          "-	Nous avons remarqué qu’il y avait des différences d’encodages au niveau des libellés des catnat (secheresse  sécheresse) ce qui entraine des valeurs manquantes (car les catnat mal écrites n’avaient pas 
                                                            de numéro de risque), et des occurrences de catnat bien encodés mais ne possédant pas de numéro de risque. Il a donc fallu réattribuer les bons numéros de risque et identifier les catnat par leur numéro de risque plutôt que les libellés.",
                                                          br(),hr(), 
                                                          "-	Pour terminer, nous avons décidé de restreindre l’étude aux 3 catnat les plus présentes dans notre base, représentant à elles seules 86% des données. Il s’agit des inondations et/ou coulées de boue, des mouvements de terrain et 
                                                          des sécheresses.",
                                                           width = 12 )),
                                                       
                                                       column(6,
                                                              box(title =strong(h4("Traitement de la Base Valeurs Foncieres")), width = 12,
                                                                 "-	Concernant cette base, elle contient des variables uniquement constituées de valeurs manquantes, nous les avons donc supprimées de la base.",hr(),
                                                                  " -	Nous avons restreint nos travaux à l’étude des maisons (logements de particuliers) et des appartements. Ce qui nous a également permis de 
                                                                 supprimer d’autres variables qui ne contenaient aucune information pour les maisons et appartements.",hr(),
                                                                 "-	Nous nous sommes séparés des variables liées aux lotissements, jugées peu pertinentes dans le cadre des travaux et avons recodé la variable « code_commune » sous 3 chiffres pour pouvoir la concaténer avec la variable 
                                                                 « code_département » et ainsi avoir une clé pour joindre nos 2 bases (la variable « cod_commune » de la base Gaspar étant codées sur 5 chiffres)", hr(),
                                                                 " -	Nous avons traité en profondeur 3 variables particulières : ", hr(),
                                                                  span("•	Valeur foncière",class = "text-primary",style="color:Grey") , ": Nous avons attribué à chaque valeur manquante la moyenne des valeurs foncières dans la commune du bâtiment concerné, et avons désigné comme valeurs extrêmes puis supprimé,
                                                                  les valeurs foncières au-dessus d’1 million d’euros.", hr(),span("•	Nombre de pièces principales et Surface réelle du bâtiment : ",class = "text-primary",style="color:Grey"),
                                                                  "On remarque que ces deux variables possèdent très peu de valeurs manquantes (concernant exactement les mêmes bâtiments) que nous décidons de supprimer. En ce qui concerne la variable nombre de pièces, nous considérons comme extrême un bâtiment 
                                                                  de plus 10 pièces ne possédant pas une surface minimum cohérente avec son nombre de pièces (que nous avons calculée)."
                                                                  
                                                                 
                                                                  ))
                                                       
                                                       
                                                     )      ),
                                          
                                          
                                          
                                          
                                          
                                          tabPanel(h5(strong("Titre 1")), ### iCI C'EST POUR LA CARTE DE FRANCE (INPUT)
                                                                   
                                                                   fluidRow(
                                                                     column(6,box(title = "Carte de france",
                                                                                  tmapOutput("mymap"), width=12)),
                                                                     
                                                                     column(6, 
                                                                            box(
                                                                              title = "Controls",
                                                                              sliderInput("slider", "Number of observations:", 1981, 2022, "",animate = T, sep = ""),width=12
                                                                            ) ,  radioButtons("Choix", label = "",choices = list("Inondation" = 1, "Secheresse" = 2, "Mouvement de terrain" = 3
                                                                                                                                 ), 
                                                                                                                         selected = 1)
                                                                            
                                                                            
                                                                            
                                                                     )
                                                                   )
                                                     
                                                   ),
                                          
                                          
                                          tabPanel(h5(strong("Generalité")) ,hr(),
                                                   
                                                   fluidRow(
                                                     
                                                     column(8, 
                                                            
                                                            box(img(src="https://raw.githubusercontent.com/Aime145/SIMULATION/main/Point.png",height="320px"),width = 12 )
                                                            , 
                                                            selected = 1 ),
                                                     column(4, box("Intepretations", width = 12))
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                   ),
                                                   fluidRow(
                                                     column(8,
                                                            box(plotlyOutput("Alpho"), width = 12 )),
                                                     column(4,box("Intepretation", width=12))
                                                     
                                                   )
                                                   
                                                   
                                                   
                                                   
                                                   
                                          ),
                                          
                                          tabPanel(h5(strong("Facteurs d'anticipation CatNat")) ,hr(),
                                                   
                                                   fluidRow(
                                                     
                                                     column(8, 
                                                            
                                                            plotOutput("sinistrePlot")
                                                            , 
                                                            selected = 1 ),
                                                     
                                                     column(4, box(radioButtons("Risque", "Choisir un risque:", choices = c("Inondation","Secheresse","Mouvement de terrain"), selected = NULL),
                                                                   selectInput("Code.departement", "Choisir un département:", choices = NULL), width = 12))
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                   ),
                                                   fluidRow(
                                                     column(8,
                                                            box(plotlyOutput("Alpho"), width = 12 )),
                                                     column(4,box("Intepretation", width=12))
                                                     
                                                   )
                                                   
                                                   
                                                   
                                                   
                                                   
                                          )
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   )
                                   )
                                   )
                            )
                        
                        
                        
                        
                        
                        , tabItem(
                          tabName = "tp5",
                          em(span(h2("Sous titre Data"),style="color:blue")),hr(),hr(),
                          fluidRow(
                            
                            column(12,
                                   DTOutput("data1") 
                            )
                            
                          ),
                          fluidRow(
                            
                            column(12,
                                   DTOutput("data2") 
                            )
                            
                          ),
                          fluidRow(
                            
                            column(12,
                                   DTOutput("data3") 
                            )
                            
                          ),
                          fluidRow(
                            
                            column(12,
                                   DTOutput("data4") 
                            )
                            
                          ),
                          fluidRow(
                            
                            column(12,
                                   DTOutput("data5") 
                            )
                            
                          ),
                          fluidRow(
                            
                            column(12,
                                   DTOutput("data6") 
                            )
                            
                          ),
                          fluidRow(
                            
                            column(12,
                                   DTOutput("data7") 
                            )
                            
                          )
                          
                          
                        )
                        
                        
                        
                        
                        
                        
                          )
                        
                        
                      
                      
                      
                      
                      
                        
                      
                        
                        
                        
                        
                        
                        ),
  
  

  controlbar = dashboardControlbar(
    skin = "dark",
    controlbarMenu(
      id = "menu",
      controlbarItem(
        h4("Pour aller plus loin") %>%
          animateAppendNested("pulse"),hr(),
        h2(span(strong("L'Algorithme de Kruskal﹖﹖﹖"),style="color:black")),hr(),br(),"Cet algorithme nous a permis de construire des arbres minimums couvrants dans l'élaboration de l'algorithme
                    de HDBSCAN.",hr(),br(),
        "L'algorithme de Kruskal est un algorithme de recherche d'arbre recouvrant
                    de poids minimum (ARPM) ou arbre couvrant minimum (ACM) dans un graphe connexe non-orienté et pondéré." ,br(),
        " Il a été conçu en 1956 par Joseph Kruskal.",hr(),br(),h4(span("Principes",style="color:black")),br(),
        "L'algorithme construit un arbre couvrant minimum en sélectionnant des arêtes par poids croissant. Plus précisément, l'algorithme considère toutes les arêtes 
                    du graphe par poids croissant (en pratique, on trie d'abord les arêtes du graphe par poids croissant) et pour chacune d'elles, il la sélectionne si elle ne crée pas un cycle. 
                     "
        
      ) )
  ),
  
  
  footer = dashboardFooter(
    
    left =  strong(span(h5("VizuData++"),style="color:gold")) %>%
      animateAppendNested("passing",speed="slow"),
    right = strong(span(h5("Paris, 13 Decembre 2023"),style="color:gold")) %>%
      animateAppendNested("horizontal"),
    fixed = FALSE
    
  )
  
)


