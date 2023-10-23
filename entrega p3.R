
# Entrega practica 3 ------------------------------------------------------

# 1 -----------------------------------------------------------------------

#Cargo mis datos
rm(list=ls())
datos <- "~/Desktop/Labo/Practicas/Guias/Datos Practica 3-20231008/"
est_azul <- read.table(paste0(datos,"AZUL.txt"))
est_catamarca <- read.table(paste0(datos,'CATAMARCA.txt'))
est_chilecito <- read.table(paste0(datos,'CHILECITO.txt'))
est_aeroparque <- read.table(paste0(datos,'AEROPARQUE.txt'))
est_iguazu <- read.table(paste0(datos,'IGUAZU.txt'))
est_mendoza <- read.table(paste0(datos,"MENDOZA.txt"))
dat_estaciones <- read.table(paste0(datos,'estaciones.txt'))
##########
list_general <- list("AZUL" = list(est_azul))
###########
info_estaciones <- array(list(),dim = c(6,9))
#Agrego los datos de ubicacion de mendoza que estan faltantes
dat_estaciones <- rbind(dat_estaciones,c("MENDOZA",-32.9,-68.8,746))
colnames(info_estaciones) <- c("Estacion","Latitud","Longitud","Altura","Codigo de identificacion","Fecha (YYYYMMDD)","Temperatura","Temperatura de rocio","Presion")


#En este ciclo estoy llenando mi array vacio con los datos de dat_estaciones
for ( i in 1:4) {                                                                
  info_estaciones[,i] <- dat_estaciones[,i] 
}

codigos <- c(est_azul[1,1],est_aeroparque[1,1],est_catamarca[1,1],est_chilecito[1,1],est_iguazu[1,1],est_mendoza[1,1])
info_estaciones[,5] <- codigos
#El valor del codigo es el mismo en cada fila
#Genero una matriz con los datos de cada estacion
est_matriz <- matrix(c(est_azul,est_aeroparque,est_catamarca,est_chilecito,est_iguazu,est_mendoza),c(6,5), byrow = T)
#Con este ciclo lleno el array de listas
for ( i in 1:6 ) {
  for ( j in 6:9 ) {
    info_estaciones[i,j] <- est_matriz[i,j-4]
  }
}
#En este ciclo convierto los datos faltantes en NA
for ( i in 1:6) {
  for(j in 7:9) {
    info_estaciones[[i,j]][which(info_estaciones[[i,j]] == 9999.9)] <- NA
  }
}
#En este ciclo hago el cambio de temperatura de farenheit a celcius
for ( i in 1:6 ) {
  info_estaciones[[i,7]] <- (info_estaciones[[i,7]] - 32) * (5/9)
  info_estaciones[[i,8]] <- (info_estaciones[[i,8]] - 32) * (5/9)
}

# 2 -----------------------------------------------------------------------

#No se como seguir con el ejercicio, voy a avisar en clase igual que lo entregué incompleto.

