top_departements_par_risque <- function(base, risque) {
  base %>%
    filter(num_risque_jo == risque) %>%
    group_by(Code.departement) %>%
    summarise(Nombre_Sinistres = n()) %>%
    arrange(desc(Nombre_Sinistres)) %>%
    slice(1:3)
}


Saliou_54<-top_departements_par_risque(base,54)
Saliou_60<-top_departements_par_risque(base,60)
Saliou_59<-top_departements_par_risque(base,59)