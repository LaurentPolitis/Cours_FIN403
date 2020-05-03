# install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer", "RCurl", "XML"))
# 
# install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer", "RCurl", "XML"))

#### Titre 1 ####

source('http://www.sthda.com/upload/rquery_wordcloud.r ' )
filePath <- "https://www.r-bloggers.com/"
res<-rquery.wordcloud(filePath, type ="url", lang = "english")


#### hello ####

#  le Diése sert à commenter le reste de la la ligne  
# tout ce qui est écrit ici ne sera pas exécuté par R  
# indiquer le but du programme ou toutes autres informations  
# Politis  et laurent dates 
a <- "hello World ! "
b = pi
print(a)
print


#### 1er function ####
hello <-function(texte=NULL){   # argument ou données d'entrées
  
  #code manipulant les données d'entrée
  
  return(texte)  #  return  renvoie le résultat de la fonction  
}
source("cours_data_visualisation/hello_fun.R")

hello("hello world !")

