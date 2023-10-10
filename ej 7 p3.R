
# ej 7 --------------------------------------------------------------------

# a -----------------------------------------------------------------------

#Pido al programa que me diga que datos son erroneos y cuales fueron las temperaturas
#del dia anterior y posterior
rm(list=ls())
temp <- scan('datos_tmedia_SABE_2010.txt')
for ( i in 1:365 ) {
  if ( temp[i] > 40 ) {
    print(paste0("El valor de la del dia ",i," es erroneo."))
    print(paste0("El valor del día anterior es ", temp[i - 1]))
    print(paste0("El valor del dia posterior es ",temp[i + 1]))
  }
}
#Que me diga la cantidad de datos erroneos
print(paste0("La cantidad de datos erroneos es de ",length(which(temp > 40))))

# b -----------------------------------------------------------------------

#calculo el valor maximo y minimo teniendo en cuenta los errores

maximo <- max(temp)
minimo <- min(temp)
print(maximo)
print(minimo)

#calculo el valor sin tener en cuenta los errores

temp2 <- replace(temp, temp > 40, NA )
temp3 <- replace(temp2, temp2 == -999, NA)
max3 <- max(temp3,na.rm = TRUE )
min3 <- min( temp3 , na.rm = TRUE )

# c -----------------------------------------------------------------------
#ordeno la serie de menor a mayor y calculo la mediana
serie_ordenada <- sort(temp3)
mediana3 <- median(temp3,na.rm = TRUE)

# d -----------------------------------------------------------------------

#genero una matriz de semanas y dias
365/7 #es 52,1; tomo 53
temp_semanal <- matrix ( temp3, 7,53,)
#convierto los datos sobrantes en NA
for ( i in 366:length(temp_semanal)) {
  temp_semanal[i] <- NA
}

media <- apply(temp_semanal, 2, mean, na.rm = TRUE)
print(media)

# e -----------------------------------------------------------------------

#formula empririca para sacar la cantidad de intervalos: 5*log(N)
#Rango de temp3: min=5.4 y max=30.3 --- Rango = 25
#Cantidad de intervalos: 30 ; Ancho de intervalos: o.83
hist(temp3,plot = TRUE)
