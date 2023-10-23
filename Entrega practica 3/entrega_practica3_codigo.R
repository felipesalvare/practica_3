
# ENTREGA PRACTICA 3 ------------------------------------------------------


# a -----------------------------------------------------------------------


rm(list=ls())
#defino el camino de donde sacar los datos y los pongo en un data frame
path <- getwd()
datos_azul <- read.table(paste0(path,"/AZUL.txt"))
datos_aeroparque <- read.table(paste0(path,"/AEROPARQUE.txt"))
datos_catamarca <- read.table(paste0(path,"/CATAMARCA.txt"))
datos_chilecito <- read.table(paste0(path,"/CHILECITO.txt"))
datos_iguazu <- read.table(paste0(path,"/IGUAZU.txt"))
datos_mendoza <- read.table(paste0(path,"/MENDOZA.txt"))
datos_estaciones <- read.table(paste0(path,"/estaciones.txt"))
#agrego los datos faltantes de mendoza
datos_estaciones <- rbind(datos_estaciones,c("MENDOZA",-32.9,-68.8,746))
colnames(datos_estaciones) <- c("estacion","latitud","longitud","altura")
#hago una lista con todas las listas (array de listas)
datos_todas <- list("Azul" = list("datos estacion" = datos_estaciones[1,],"codigo" = datos_azul[1,1],"fecha" = datos_azul[,2],
                                  "temperatura" = datos_azul[,3],"t de rocio" = datos_azul[,4],"presion"=datos_azul[,5]),
"Aeroparque"= list("datos estacion"=datos_estaciones[2,],"codigo"=datos_aeroparque[1,1],"fecha"=datos_aeroparque[,2],
                    "temperatura"=datos_aeroparque[,3],"t de rocio"=datos_aeroparque[,4],"presion"=datos_aeroparque[,5]),
"Catamarca"=list("datos estacion"=datos_estaciones[3,],"codigo"=datos_catamarca[1,1],"fecha"=datos_catamarca[,2],
                 "temperatura"=datos_catamarca[,3],"t de rocio"=datos_catamarca[,4],"presion"=datos_catamarca[,5]),
"Chilecito"=list("datos estacion"=datos_estaciones[4,],"codigo"=datos_chilecito[1,1],"fecha"=datos_chilecito[,2],
                 "temperatura"=datos_chilecito[,3],"t de rocio"=datos_chilecito[,4],"presion"=datos_chilecito[,5]),
"Iguazu"=list("datos estacion"=datos_estaciones[5,],"codigo"=datos_iguazu[1,1],"fecha"=datos_iguazu[,2],
              "temperatura"=datos_iguazu[,3],"t de rocio"=datos_iguazu[,4],"presion"=datos_iguazu[,5]),
"Mendoza"=list("datos estacion"=datos_estaciones[6,],"codigo"=datos_mendoza[1,1],"fecha"=datos_mendoza[,2],
               "temperatura"=datos_mendoza[,3],"t de rocio"=datos_mendoza[,4],"presion"=datos_mendoza[,5]))
#cambio los datos faltantes por NA
for(i in 1:6) {
  for(j in 1:6) {
    datos_todas[[i]][[j]][(which(datos_todas[[i]][[j]] == 9999.9))] <- NA
  }
}
#cambio las temperaturas a celsius
for ( i in 1:6 ) {
  for ( j in 4:5 ) {
    datos_todas[[i]][[j]] <- round(((datos_todas[[i]][[j]] - 32) * (5/9)),digits = 2) 
  }
}

# b -----------------------------------------------------------------------

#con esta funcion obtengo un resumen de las estaciones
resumen_estaciones <- function(array) {
  nombres_temp <- c()
  datos_temp <- c()
  mediaT_temp<- c() ; mediaP_temp <- c() ; mediaTD_temp <- c()
  desvT_temp <- c() ; desvP_temp <- c() ; desvTD_temp <- c()
  maxT_temp <- c(); maxP_temp <- c() ; maxTD_temp <- c()
  minT_temp <- c(); minP_temp <- c() ; minTD_temp <- c()
  fecha_inicial <- c()
  fecha_final <- c()
  i = 0
  for ( i in 1:6 ) {
    nombres_temp <- c(nombres_temp,array[[i]][[1]][1,1])
    datos_temp <- c(datos_temp,sum(lengths(array[[i]][4]),lengths(array[[i]][5]),lengths(array[[i]][6])))
    fecha_inicial <- (c(fecha_inicial,array[[i]][[3]][1])) ; fecha_final <- (c(fecha_final,array[[i]][[3]][length(array[[i]][[3]])]))
    mediaT_temp <- (c(mediaT_temp,lapply(array[[i]][4],mean,na.rm=T))) ; mediaTD_temp <- c(mediaTD_temp,lapply(array[[i]][5],mean,na.rm = T)) ; mediaP_temp <- (c(mediaP_temp,lapply(array[[i]][6],mean,na.rm = T)))
    desvT_temp <- (c(desvT_temp,lapply(array[[i]][4],sd,na.rm=T))) ; desvTD_temp <- (c(desvTD_temp,lapply(array[[i]][5],sd,na.rm=T))) ; desvP_temp <- (c(desvP_temp,lapply(array[[i]][6],sd,na.rm = T )))
    maxT_temp <- (c(maxT_temp,lapply(array[[i]][4],max,na.rm=T))) ; maxTD_temp <- (c(maxTD_temp,lapply(array[[i]][5],max,na.rm=T))) ; maxP_temp <- (c(maxP_temp,lapply(array[[i]][6],max,na.rm=T)))
    minT_temp <- (c(minT_temp,lapply(array[[i]][4],min,na.rm=T))) ; minTD_temp <- (c(minTD_temp,lapply(array[[i]][5],min,na.rm=T))) ; minP_temp <- (c(minP_temp,lapply(array[[i]][6],min,na.rm=T)))
  }
  tabla_datos <- data.frame("cantidad de datos" = datos_temp,
                            "fecha inicial" = fecha_inicial,
                            "fecha final" = fecha_final,
                            "temperatura media" = array(mediaT_temp,c(6,1)),
                            "desvio de temperatura" = array(desvT_temp,c(6,1)),
                            "temperatura maxima" = array(maxT_temp,c(6,1)),
                            "temperatura minima" = array(minT_temp,c(6,1)),
                            "temperatura de rocio media" = array(mediaTD_temp,c(6,1)),
                            "desvio de temperatura de rocio" = array(desvTD_temp,c(6,1)),
                            "temperatura de rocio maxima" = array(maxTD_temp,c(6,1)),
                            "temperatura de rocio minima" = array(minTD_temp,c(6,1)),
                            "presion media" = array(mediaP_temp,c(6,1)),
                            "desvio de presion" = array(desvP_temp,c(6,1)),
                            "presion maxima" = array(maxP_temp,c(6,1)),
                            "presion minima" = array(minP_temp,c(6,1)), row.names = nombres_temp
                            )
  return(tabla_datos)
}
resumen_estaciones(datos_todas)

#con esta funcion puedo conocer que estaciones se encuentran en unas coordenadas determinadas
ubicacion_estaciones <- function(array,lamin,lamax,lonmin,lonmax) {
  est_no <- c()
  est_si <- c()
  i = 0
  for ( i in 1:6) {
    if ( as.numeric(array[[i]][[1]][1,2]) < lamin ) {
      est_no <- c(est_no, array[[i]][[1]][1,1])
    } else if ( as.numeric(array[[i]][[1]][1,2]) > lamax ) {
      est_no <- c(est_no, array[[i]][[1]][1,1])
    } else if ( as.numeric(array[[i]][[1]][1,3]) < lonmin ) {
      est_no <- c(est_no, array[[i]][[1]][1,1])
    } else if ( as.numeric(array[[i]][[1]][1,3]) > lonmax ) {
      est_no <- c(est_no, array[[i]][[1]][1,1])
    } else {
      est_si <- c(est_si, array[[i]][[1]][1,1])
    }
  }
  if ( length(est_no) == 6 ) {
    print("No hay estaciones cercanas")
  } else {
    print(paste0(est_si," es una estacion cercana."))
  }
}
ubicacion_estaciones(datos_todas,-30,-20,-80,-20)

#con esta funcion guardo la lista con todos los datos externamente
guardar_info <- function(array) {
  save(array, file = "Datos_estaciones.Rdata")
}

