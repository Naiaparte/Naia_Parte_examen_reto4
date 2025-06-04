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

################################ LIMPIEZA DE DATOS ################################

#cargar datos
datos <- read.csv("C:/Users/Personal/Downloads/netflix.csv")

str(datos)
summary(datos)
sd(datos$Minutes, na.rm = T)
sd(datos$Seasons, na.rm = T)

#¿Cuántos elementos únicos hay en cada una de las categorías? 
length(unique(datos$type)) #3
length(unique(datos$country)) #87
length(unique(datos$director)) #4516




