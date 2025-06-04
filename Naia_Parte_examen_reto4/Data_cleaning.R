library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)

################################ DATA CLEANING ################################

#cargar datos
datos <- read.csv("C:/Users/Personal/Downloads/netflix.csv")

#A)	¿Analiza el número de NAs por variable? 
miss_var_summary(datos)

#B)	Visualiza la distribución de NAs. En función de la distribución (MACR, MAR, MNAR)
#y las variables afectadas ¿Qué tratamiento de NAs podríamos aplicar? 
vis_miss(datos)

#C)	Aplica el tratamiento de NAs de modo que podamos trabajar más adelante con
#las variables ‘Minutes’ y ‘Seasons’. 
datos_imputados <- kNN(datos, variable = "Minutes",
                       dist_var = colnames(datos), k=3)
datos_imputados$Seasons <- ifelse(datos_imputados$type == "Movie", 0, 1)
datos_imputados <- datos_imputados[,-12]



