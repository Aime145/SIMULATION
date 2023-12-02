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
