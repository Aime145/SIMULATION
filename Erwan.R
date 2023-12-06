

annee=year(base$dat_deb)
count=function(x){
  return(length(x)-sum(is.na(x)))
}
count=Vectorize(count)

nb_event=tapply(base$lib_risque_jo,annee,count)
data=data.frame(x=names(nb_event),y=nb_event)

fig=ggplot(data, aes(x=x, y=y)) +
  geom_area( fill="lightblue", colour='black') +
  geom_line(color="#69b3a2", size=2) +
  geom_point(size=3, color="#69b3a2") +
  ggtitle("Evolution du nombre d'évenements par année")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
fig