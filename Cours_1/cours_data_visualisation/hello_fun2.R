# Premier programme
# afficher  "hello world !" dans la console
# Politis Laurent le 14/03/2016


# a <- "hello World ! "
# 
# print(a)

hello <-function(texte=NULL){  
  #on souhaite coller le nom de l'utilisateur à "hello world"
  # on récupère le nom de l'utilisateur 
  nom <- Sys.getenv("USERNAME") # fonction trouvée via une recherche web
  # on colle le nom de l'utilisateur
  texte <- paste(nom,texte)
  
  return(texte)  #  return  renvoie le résultat de la fonction  
}

hello("hello world !")