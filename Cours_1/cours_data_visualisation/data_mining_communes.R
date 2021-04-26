######
#
#  Data Mining INSEE populations française
#  Création d'une data frame à partir de http://www.insee.fr/fr/themes/detail.asp?reg_id=99&ref_id=base-cc-serie-historique
# 
# Auteur : Politis Laurent
# Mail : politis.laurent@gmail.com  
# 
########
library(readr)

# PATH <-"C:\Users/Laurent/Documents/" # A changer chemin du dossier courant où vous travaillez 

# Importer les données 
#____________________________________________________________________________________________
# OLD LINE 
# population_ville <- read.csv(paste(PATH,"population_ville.csv",sep=""), sep=";", stringsAsFactors=FALSE,row.names = "CODGEO" ) 

population_ville <- read_delim("https://raw.githubusercontent.com/LaurentPolitis/Data_Viz_Fin403/master/data/population_ville.csv",
";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"),
trim_ws = TRUE)

# sous forme de data frame 
#____________________________________________________________________________________________

class(population_ville)

# explorer les données sous R studio 
#____________________________________________________________________________________________
  View(population_ville)
 
# voir le début et la fin d'un fichier 
#____________________________________________________________________________________________

  head(population_ville)
  tail(population_ville)
   
#  la dimension de la data frame 
#___________________________________________________________________________________________________
  
  dim_pop = dim(population_ville) # la fonction dim renvoie le nombre de ligne puis le nombre de colonne 
  
# complete.cases() renvoie un vecteur de boolean TRUE si la ligne est compléte FALSE sinon 
#____________________________________________________________________________________________  
  
 vec_na = complete.cases(population_ville)
 
 # La somme d'un vecteur de Boolean considère TRUE comme 1 et FALSE 0
 #____________________________________________________________________________________________  
 
 sum_na = sum(vec_na) # compte le nbr de ligne où il n'y a pas de données manquantes
 
 # test pour savoir si il y a des données manquantes dans les données
 #____________________________________________________________________________________________  
 
 dim_pop[1] == sum_na
    
# Importer les noms des colonnes  
#____________________________________________________________________________________________

  # legende <- read.csv(paste(PATH,"legende.csv",sep=""), sep=";")

 legende <- read_delim("https://raw.githubusercontent.com/LaurentPolitis/Data_Viz_Fin403/master/data/legende.csv", 
                       ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                       trim_ws = TRUE)

  colnames(population_ville) = setNames(nm = legende$CODGEO,object = legende$`Code géographique`)[ colnames(population_ville) ]
  
  colnames(population_ville)[3] = "Communes"
  
  
  
 
  