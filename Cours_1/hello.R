#### 1er function ####
hello <- function(texte=NULL){   # argument ou données d'entrées
  
  #code manipulant les données d'entrée
  texte <- paste(texte, Sys.getenv("USERNAME"), "!")
  
  return(texte)  #  return  renvoie le résultat de la fonction  
}

