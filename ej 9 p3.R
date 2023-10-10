
# ej 9 p3 -------------------------------------------------------------------

rm(list=ls())
load('t_media_EF.RData')

colnames(estaciones) <- c("Estaciones","Enero","Febrero")
rownames(estaciones) <- c("1","2","3","4","5")

anomalia_anio <- c()
nombre_estacion <- c()
a <- 0

for ( i in 1:5 ) {
  estacion <- sapply(estaciones[i,2:3], mean)
  anomalia_enero <- estaciones[[i,2]] - estacion[1]
  posicion <- which.max(abs(anomalia_enero))
  anomalia_anio[i] <- 1981 + posicion
  nombre_estacion[i] <- estaciones[[i,1]]
  a <- anomalia_max_valor[i] <- anomalia_enero[posicion]
  print(paste0("En el anio ",anomalia_anio[i]," en la estacion de ",nombre_estacion[i]," se alcanzo la maxima anomalia, cuyo valor fue ",a))
}

info_anomalias_estacion <- data.frame(nombre_estacion,anomalia_anio,anomalia_max_valor)

# b -----------------------------------------------------------------------


