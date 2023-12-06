library(dplyr)
gaspar=read.csv("/Users/phonedegerland/Desktop/CONCOURS EURIA/catnat_gaspar.csv",sep=";",encoding = "UTF-8")
DVF=read.delim2("/Users/phonedegerland/Desktop/CONCOURS EURIA/valeursfoncieres-2022.txt",sep="|",encoding = "UTF-8")
#View(gaspar)
######### CHALLENGE DATA VISUALISATION ##########

### Base DVF

#head(DVF)
# Elle contient les infos relatives aux transactions immobilières survenues en France métropolitaine en 2022
# Variables à supprimer pour faciliter la manipulation de la base : 7 premières (toutes les valeurs sont NA)
DVF=DVF[,8:ncol(DVF)]

# Se limiter à l'étude des appartements et maisons (suggestion de l'institut de prioriser les biens privés)
DVF=DVF[(DVF$Code.type.local %in% c(1,2)),]
DVF$Code.commune=as.factor(DVF$Code.commune)
DVF$Code.postal=as.factor(DVF$Code.postal)

#summary(DVF) # On peut maintenant supprimer les variables Identifiant local (all NA),No Volume(all "")
DVF=select(DVF,-c(No.Volume,Identifiant.local))
#summary(DVF)
f=function(code){return(sprintf("%03d",as.numeric(code)))}
DVF$Code.commune=f(DVF$Code.commune)
DVF$cod_commune=paste0(DVF$Code.departement,DVF$Code.commune)

## On peut enlever la variable Prefixe de section (95,46% de NA et information redondante avec la colonne Section)
DVF=DVF[,-14]

## On peut enlever les variables relatives aux 3e,4e et 5e lots(>=99,5% NA) et les quantiles de la variable nbre de lots
# montrent que 75% des logements de notre base ne possède pas plus d'un seul lot 
# On va même jusqu'à enlever les variables 1er lot(81,6% NA), 2e lot(95,2% NA) et Nbre de lots (sans grand intérêt
# pour les maisons et apparts, plus d'intérêts avec les immeubles). 
DVF=DVF[,-c(16:26)]

## Traitement Valeur fonciere
moyennes_par_commune = DVF %>%
  group_by(cod_commune) %>%
  summarise(moyenne_valeur = mean(`Valeur.fonciere`, na.rm = TRUE))
# Remplacer les valeurs manquantes par les moyennes correspondantes (moyenne de la commune)
DVF = DVF %>%
  left_join(moyennes_par_commune, by = "cod_commune") %>%
  mutate(`Valeur.fonciere` = ifelse(is.na(`Valeur.fonciere`), moyenne_valeur, `Valeur.fonciere`)) %>%
  select(-moyenne_valeur)  # Supprimer la colonne moyenne ajoutée
#summary(DVF)
DVF <- DVF %>%
  filter(!is.na(`Valeur.fonciere`)) # On enlève les 3 NA qui restent
# Valeurs extremes (Regarder les VE par département)
boxplot(DVF$Valeur.fonciere) # On est tenté de prendre 2e8 comme seuil
summary(DVF$Valeur.fonciere) # Le 3e quantile 350k<<<2e8 donc on prend 1e6
DVF <- DVF %>%
  filter(!(DVF$Valeur.fonciere > 1e6))
boxplot(DVF$Valeur.fonciere)# On peut descendre en dessous de 1million (valeur>600000= 0,000 000 02%)



## Traitement Nbre de pieces principales & Traitement Surface reelle bati 
#View(DVF[is.na(DVF$Nombre.pieces.principales),])#les lignes NA de Surface.reelle.bat=celles de Nb pieces principales
DVF <- DVF %>%
  filter(!is.na(`Nombre.pieces.principales`))# On supprime les NA (0,00006%)
boxplot(DVF$Nombre.pieces.principales) #10 semble être un bon seuil mais il faut tenir compte de la taille du batiment
# On cherche le ratio entre la taille de la maison et le nombre de pièces, pour déterminer la surface réelle minimum
# qu'un batiment doit avoir au vu de son nbre de pièces
ratio=quantile(DVF$Surface.reelle.bati/DVF$Nombre.pieces.principales,0.25) #1er quantile pour minimiser le seuil de surface
# On retire donc les logements avec plus de 10 pièces principales mais qui n'ont pas la surface requise 
DVF <- DVF %>%
  filter(!(DVF$Nombre.pieces.principales>10 & DVF$Surface.reelle.bati<10*ratio))

## Traitement Surface de terrain (38% NA): On ne l'utilise pas


### Base Gaspar

gaspar=gaspar[,-(8:10)]
gaspar$dat_deb = as.POSIXct(gaspar$dat_deb, format = "%Y-%m-%d %H:%M:%S")
gaspar$dat_fin = as.POSIXct(gaspar$dat_fin, format = "%Y-%m-%d %H:%M:%S")
gaspar[,"mois"]=as.factor(months.POSIXt(gaspar$dat_deb))
gaspar[,"saison"]=ifelse(gaspar[,"mois"]%in%c("décembre","janvier","février"),"hiver",ifelse(gaspar[,"mois"]%in%c("mars","avril","mai"),"printemps",ifelse(gaspar[,"mois"]%in%c("juin","juilliet","août"),"été","automne")))
#head(gaspar)

## Variables num_risque_jo et lib_risque_jo: Il y a des différences d'encodage de certains libellés de catnat qui 
# doivent être corrigés. Ex: Sécheresse et S?cheresse. On leur attribue le même num_risque_jo. (Problème 1)
lib_acorrige=levels(as.factor(gaspar[is.na(gaspar$num_risque_jo),"lib_risque_jo"]))#Toutes les catnat à problème
num_lib_acorrige=levels(as.factor(gaspar[gaspar$lib_risque_jo %in% lib_acorrige,"num_risque_jo"]))
## On remarque qu'il y a des catnat pour lesquelles certaines occurences n'ont pas de num_risque_jo alors que
# d'autres oui, dans ce cas on leur attribue le même num_risque_jo (Problème 2)
#summary(gaspar[gaspar$lib_risque_jo==lib_acorrige[10],"num_risque_jo"])#En itérant on trouve les libellés avec les
# problèmes d'occurences à partir de leurs indices dans lib_acorrige : [6]:60 ;[10]:62 ;[1]:66
gaspar[is.na(gaspar$num_risque_jo) & gaspar$lib_risque_jo==lib_acorrige[6],"num_risque_jo"]=60
gaspar[is.na(gaspar$num_risque_jo) & gaspar$lib_risque_jo==lib_acorrige[10],"num_risque_jo"]=62
gaspar[is.na(gaspar$num_risque_jo) & gaspar$lib_risque_jo==lib_acorrige[1],"num_risque_jo"]=66 #Problème 2 résolu
lib_acorrige=levels(as.factor(gaspar[is.na(gaspar$num_risque_jo),"lib_risque_jo"]))#Mise à jour des catnat à problème(8catnats)
# On peut résoudre le problème de 4 d'entre elles:
gaspar[gaspar$lib_risque_jo==lib_acorrige[7],"num_risque_jo"]=59 # On associe S?cheresse à la Sécheresse
gaspar[gaspar$lib_risque_jo==lib_acorrige[3],"num_risque_jo"]=54# On associe Inondations et/ou Coul?es de Boue
gaspar[gaspar$lib_risque_jo%in%lib_acorrige[c(1,2)],"num_risque_jo"]=68#Choc/Chocs M?caniques li?s ? l'action des vagues
# On peut à présent identifier les catnats par la variable num_risque_jo à la place des libellés, il restera 4 catnat
# pour lesquelles nous sommes obligés d'utiliser les libellés pour les identifier

## On veut se limiter aux 3 catnats les plus récurrentes
t=table(gaspar$num_risque_jo)
t[order(t)][19:21] # Ce sont les num_risque_jo:54-59-60
table(gaspar$lib_risque_jo) # On se rassure que les catnat uniquement identifiables par le libellé n'y sont pas
gaspar <- gaspar %>%
  filter(num_risque_jo%in%c(54,59,60))
#summary(gaspar) # On a juste retiré 20k lignes


### Fusion des deux bases

base = inner_join(gaspar,DVF,by = "cod_commune") # base qui ne conserve que les données des cod_commune communs