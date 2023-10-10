
# ej 5 --------------------------------------------------------------------

# a -----------------------------------------------------------------------


#armo un script que permita ingresar una serie de datos y devulelva la hora y el valor del max

rm(list=ls())
i = 0
datos <- matrix(1:8,1,8,byrow = TRUE)
for (i in 1:8) {
  datos[i] = (as.numeric(readline("Ingrese un valor de temperatura: ")))
  if (i == 1) {
    maximo <- datos[i]
  } else if (datos[i] > maximo) {
    maximo <- datos[i]
  }
}
hora <- which(datos == maximo)
print(paste0("La temperatua maxima fue de ",maximo," y ocurrio a las ",(hora*3)-3))

# b -----------------------------------------------------------------------
#Mismo ejercicio usando la funcion max()
rm(list=ls())
datos <- matrix(1:8,1,8,byrow = TRUE)
for (i in 1:8) {
  datos[i] = (as.numeric(readline("Ingrese un valor de temperatura: ")))
}
hora <- which(datos == max(datos))
print(paste0("La temperatura maxima fue de ",max(datos)," y ocurrio a las ",(hora*3)-3))

# c -----------------------------------------------------------------------

rm(list=ls())
sumatoria <- 0
for ( i in 1:8) {
  tempe <- as.numeric(readline("Ingrese un valor de temperatura: "))
  sumatoria <- sumatoria + tempe
  #datos[i] = (as.numeric(readline("Ingrese un valor de temperatura: ")))
}

#Ahora usando la funcion instrinseca sum()

rm(list = ls())
datos <- matrix(1:8,1,8,byrow = TRUE)
for ( i in 1:8) {
  datos[i] <- as.numeric(readline("Ingrese un valor de temperatura: "))
}
print(sum(datos))

# d -----------------------------------------------------------------------


