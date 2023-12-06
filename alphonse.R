duree_evenements_en_secondes=(base$dat_fin - base$dat_deb)
duree_evenements_en_heures=as.numeric(duree_evenements_en_secondes, units = "hours")
duree_evenements_en_jours = duree_evenements_en_heures/24

###### violon plot
library(plotly)
library(ggplot2)
ggplotly(ggplot(data = base, aes(x = " ", y = duree_evenements_en_jours)) +
           geom_violin(fill = "purple") +
           labs(title = "Repartition de la duree des evenements",
                y = "Duree (jours)")+
         theme(axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank())
)


### environ xx% des evenements durent moins de 2 mois 


borne_inf <- 0
borne_sup <- 60*3600*24
nombre_dans_zone <- sum((base$dat_fin - base$dat_deb) >= borne_inf  & (base$dat_fin - base$dat_deb) <= borne_sup )
pourcentage_dans_zone <- (nombre_dans_zone / nrow(base)) * 100
pourcentage_dans_zone


