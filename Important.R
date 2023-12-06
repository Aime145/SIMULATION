library(rnaturalearth)
library(sf)
library(mapview)
library(dplyr)

  
  


  



  
welco<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/238854620_109912131405422_8459662244668803347_n.jpg?_nc_cat=100&_nc_rgb565=1&ccb=1-5&_nc_sid=0debeb&_nc_ohc=AquAAmxSS18AX8d6qOz&_nc_ht=scontent.frns1-1.fna&oh=37150a3fd929c447667d38b2fe27332a&oe=61442B29"
welcogif<-"https://p5.storage.canalblog.com/57/03/922142/126988247.gif"
l11<-"https://camo.githubusercontent.com/3dc437b0972f795fbc40717814b060840462294baf6cf34546938382a7e339a0/68747470733a2f2f64313768323774366835313561352e636c6f756466726f6e742e6e65742f746f706865722f323031372f4a756c792f35393631366261645f73637265656e2d73686f742d323031372d30372d30382d61742d342e33322e32322d706d2f73637265656e2d73686f742d323031372d30372d30382d61742d342e33322e32322d706d2e706e67"
l2<-"https://miro.medium.com/max/724/0*PQTm0HWuxQHuxHyl.gif"
acceuill2<-"http://yinsenm.github.io/figure/tsne.gif"
acceuill3<-"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/K-Medoids_Clustering.gif/350px-K-Medoids_Clustering.gif"
acceuill4<-"http://shabal.in/visuals/kmeans/left.gif"
test1<-"Tout ce qui nous entoure, qu’il s’agisse de choses physiques ou abstraites, nous apparaît\nde façon organisée. Lorsque nous voyons un animal, nous le désignons systématiquement\npar l’espéce à laquelle il appartient. Un sentiment sera également catégorisé, on parlera\npar exemple d’un sentiment de tristesse, de joie ou de peur. Pourtant, chacun éprouve la\npeur différemment et les chiens ne sont pas tous identiques non plus. Il s’agit, en fait, d’un\nphénoméne, conscient ou non, mais naturel et indispensable, de simplification pour mieux\ncomprendre et mieux communiquer."
titre<-"La classification non supervisée désigne un corpus de méthodes ayant pour objectif de dresser\nou de retrouver une typologie existante caractérisant un ensemble de n observations, à partir\nde p caractéristiques mesurées sur chacune des observations"
titree<-"La classification non supervisée regorge assez d'algorithme mais nous nous contenterons de presenter que 3 à savoir :"
soustitre1<-"- Algorithmes de PAM"
soustitre2<-"- Algorithmes DBSCAN"
soutritre4<-"- Algorithmes HDBSCAN."
soustitre3<-"l'application permet de reproduire le package Pam, Dbscan et Hdbscan."
pam1<-"Le Partitioning Around Medoids (PAM) est un algorithme d’apprentissage automatique (Machin Learning) non supervisé pour l’analyse de regroupement(clustering) conçu par le statisticien Rousseuw et Kaufman en 1988 "
pam11<-"Rousseuw né le 13 octobre 1956 est un statisticien connu pour ses travaux sur les statistiques robustes et l’analyse de cluster,\nIl est actuellement professeur à la KU Leuven, Belgique. Il est membre de l’Institute of Mathematical Statistics (1993) et de l’American Statistical Association (1994).\n "
pam111<-"L'algorithme de PAM recherche k objets représentatifs dans un ensemble de données (appelés k médoïdes), puis il attribue chaque objet \nau médoïde le plus proche afin de créer des clusters. Son but est de minimiser la somme des dissemblances entre les objets d'un cluster et le centre du même cluster (médoïde). Il est connu pour être un algorithme\nplus robuste que celui des k-means puisqu’il est considéré comme moins sensible aux valeurs aberrantes.\n"
pam1111<-"Le terme médoïde désigne un objet au sein d'un cluster pour lequel la dissemblance moyenne entre lui et tous les autres membres du cluster est minime. Il correspond au point le plus central du cluster. Ces objets (un par \n"
imapam1<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/239374029_109103838152918_7616761309331699951_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=0debeb&_nc_ohc=pojLGw2LamAAX-HnjDv&_nc_ht=scontent.frns1-1.fna&oh=36fdb55250f30cdf5a10c90c4b9e27de&oe=61431936"
imapam<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/239356638_109893604740608_4257593121699540841_n.jpg?_nc_cat=103&_nc_rgb565=1&ccb=1-5&_nc_sid=0debeb&_nc_ohc=qQatHTE4fyYAX_ZEUjt&_nc_ht=scontent.frns1-1.fna&oh=2797a08c8f6f40a62097f32c9fe0d5a2&oe=614427DF"
pam22<-"cluster) peuvent être considérés comme un exemple\n          représentatif des membres de ce cluster, ce qui peut être utile dans certaines situations."
pam2<-"Rappelons que, dans le clustering k-means, le centre d'un cluster donné est calculé comme la valeur moyenne de tous les points de données du cluster.\nK-medoid est une alternative robuste au clustering k-means. Cela signifie que l'algorithme est moins sensible au bruit et aux valeurs aberrantes, par rapport aux k-moyennes, car il utilise des médoïdes comme centres de cluster au lieu des moyennes (utilisées dans les k-moyennes).\n"
pam2222<-"L'algorithme k-medoids demande à l'utilisateur de spécifier k, le nombre de clusters à générer (comme dans le clustering k-means). \nUne approche utile pour déterminer le nombre optimal de clusters est la méthode de la silhouette.\n       "
pam222<-"Nous vous avons illustrés les étapes de cet algorithmes, Cliquez donc sur l'icon Vue."
dbscan1<-"Le DBSCAN est un algorithme non supervisé très connu en matière de Clustering.\n           Il a été proposé 1996 par Martin Ester, Hans-Peter Kriegel, Jorg Sander et Xiawei Xu.\n          "
dbscan11<-" Étant donnés des points et un entier k, l’algorithme vise à diviser les points en k\n           groupes, appelés clusters, homogènes et compacts.\n           Le DBSCAN est un algorithme simple qui définit des clusters en utilisant \n           l’estimation de la densité locale. On peut le diviser en 4 étapes:\n           "
dbscan111<-"1- Pour chaque observation on regarde le nombre de points qui a au moins une distance epsilon \n           de celle-ci: On appelle cette zone le epsilon-voisinage de l’observation.\n           "
dbscan1111<-"2- Si une observation compte au moins un certain nombre de voisins y compris elle-même, \n           elle est considérée comme une observation coeur. On a alors décelé une observation à haute densité.\n           "
dbscan11111<- "3- Toutes les observations au voisinage d’une observation coeur appartiennent au meme cluster. Il peut y avoir des observations \ncœur proche \n           "
dbs11111<-"les unes des autres. Par conséquent \n           de proche en proche on obtient une longue séquence d’observations cœur qui constitue un unique cluster."
dbscan111111<-"4-Toute observation qui n’est pas une observation coeur et qui ne comporte pas d’observation coeur dans son \n           voisinage est considérée comme une anomalie.\n          "
dbc<-"DBSCAN permet de gérer les valeurs aberrantes ou anomalies."
dbscan2<-"Le véritable problème dans l'algorithme de Dbscan est le choix de ces paramètres qui reste très complexe.\n           "
imadbscan1<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/238830577_109870701409565_8855582025621358578_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=0debeb&_nc_ohc=mJXVKbs53voAX9D3uLd&_nc_ht=scontent.frns1-1.fna&oh=d946d9281e0b4d443c6c63196815ee2d&oe=6143D646"
imadbsca3<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/238776912_109882611408374_6364468330228440304_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=0debeb&_nc_ohc=LPqqkb3aeUQAX_nc7Hw&_nc_ht=scontent.frns1-1.fna&oh=bf302adf2326b658d8b811dce5467242&oe=6144DD2F"
hdbscan1<-"HDBSCAN est un algorithme de clustering développé par Ricardo CAMPELLO, Davoud MOULAVI et Joerg SANDER du département des sciences informatiques de l’Université de l’Alberta,\nEdmonton au Canada. Il transforme DBSCAN en un algorithme de clustering hiérarchique dont il\nest ensuite extrait des clusters plats selon un critère de stabilité. Pour y parvenir, HDBSCAN suit\nun processus en 5 grandes étapes :"
etape1<-"Etape 1: Construction d’une nouvelle métrique d’évaluation des zones denses et\ndes zones clairsemées."
exp1<-"Cette consiste à definir une nouvelle distance appelée Distance d'accessibilité mutuelle et a pour objectif d’accentuer l’écart dans l’espace entre\nles points appartenant à une zone dense et ceux appartenant à une zone clairsemée"
etape2<-"Etape 2 : Construction d’arbres minimums couvrants."
exp2<-"A cette etape on passe à la creaction des groupes\nde points minimisant le chemin les reliant. pour y parvenir, l’algorithme utilise la théorie des graphes pour obtenir des\narbres couvrants minimums de chaque grappe mère préalablement constituées."
imagdbscan1<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/238808304_109847241411911_6454037798348771730_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=0debeb&_nc_ohc=sF9c1xvNw7gAX8yNVuA&tn=Ctub7sqEEGC8CLdS&_nc_ht=scontent.frns1-1.fna&oh=d486c34454745f1a05d55cebced5b850&oe=6143E8BE"
imagdbscan2<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/236134075_109852224744746_1344738163072277420_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=0debeb&_nc_ohc=pmjLhz_og8oAX-dm3oU&tn=Ctub7sqEEGC8CLdS&_nc_ht=scontent.frns1-1.fna&oh=5af6b8d2f1f627e0b0b777f7bc8fd61c&oe=614395F7"
imagdbscan3<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/238739082_109857044744264_1532532874660822616_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=0debeb&_nc_ohc=7R4xcSAI0a8AX845SvZ&_nc_ht=scontent.frns1-1.fna&oh=f071b35a639b7b3ab708b90286e5f146&oe=614530E3"
imagehdbscan4<-"https://scontent.frns1-1.fna.fbcdn.net/v/t1.6435-9/239828457_109863034743665_7577321535243800424_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=0debeb&_nc_ohc=Hv9fsrzw9ioAX-UwIAH&_nc_ht=scontent.frns1-1.fna&oh=148ccf23a522912f0f2f584b1bdeb66d&oe=614759A9"
etape3<-"Etape 3 : Hiérarchisation des clusters."
exp3<-"Compte tenu de l'arbre couvrant minimal, l'étape suivante consiste à le convertir dans la hiérarchie des composants connectés. Cela se fait le plus facilement dans \nl'ordre inverse: triez les arêtes de l'arbre par distance (dans l'ordre croissant), puis parcourez, créant un nouveau cluster fusionné pour chaque arête. \n"
etape4<-"Etape 4 : Condensation de l’arborescence des clusters."
exp4<-"Cette étape vise à former des clusters contenants un nombre minimal choisi de points"
etape5<-"Etape 5 : Extraction des clusters plats."
Apropos1<-"Cette application a été réalisé par Aimé Magloire Ndjeng,  ."
Apropos2<-"Ce projet a été supervisé par Monsieur, Professeur ."
Apropos3<-"Ce TER m'a permi d'avir une belle notion dans le fonctionnement du Machin learning\n            précisement dans les algorithmes de classifications Non Supervisées."
Apropos4<-"De plus, ce projet m'a permi de mieux maîtriser les algorithmes et le langage R."
dure<-"Durée du TER:"
dure1<-"1"
question1<-"Si vous aviez des questions ou des préoccupations sur ce Projet, veuillez me contacter en cliquant sur le bouton ci dessous. Merci!!!"

Apropos<-"FREY"

