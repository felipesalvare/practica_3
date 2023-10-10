
# ej 6 --------------------------------------------------------------------


# a -----------------------------------------------------------------------
rm(list=ls())
setwd("~/Desktop/Labo/Practicas/Guias/Datos Practica 3-20231008")
load("temp_bsas.RData")

temp_mensual <- array(variable,c(8,14,4,12,6))
temp_promedio <- array(NA,c(8,14,4,12))
for ( i in 1:8 ) {
  for ( j in 1:14 ) {
    for ( k in 1:4 ) {
      for ( l in 1:12 ) {
        temp_promedio[i,j,k,l] <- mean(temp_mensual[i,j,k,l,])
      }
    }
  }
}
temp_promedio
#Ahora hago lo mismo pero con apply

temp_mean <- apply(temp_mensual, c(1,2,3,4), mean)

# b -----------------------------------------------------------------------

temp_media_anual <- apply(temp_mensual, c(1,2,3,5), mean)


# c -----------------------------------------------------------------------

temp_media_anual[,,2,]

# d -----------------------------------------------------------------------

#La latitud de olavarria es aprox -36,9 y la longitud es -60
latitudOl <- -36 #Elemento 7
longitudOl <- 300 #Elemento 6

temp_media_anual[6,7,1,] #temperatura media anual de olavarria a 1000 hpa

