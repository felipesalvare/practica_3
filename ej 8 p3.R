
# ej 8 p3 -----------------------------------------------------------------


# a -----------------------------------------------------------------------

rm(list = ls())
#voy a hacer una funcion que me permita calcular la media, el valor maximo, el valor minimo
#y la deviacion estandar de una serie de N elementos

datos_serie <- function(x) {
  x1 <- mean(x, na.rm = TRUE)
  x2 <- max(x, na.rm = TRUE)
  x3 <- min(x, na.rm = TRUE)
  x4 <- sd(x, na.rm = TRUE)
  print(paste0("La media de la serie es: ",x1))
  print(paste0("El maximo de la serie es ",x2," y el minimo es ",x3))
  print(paste0("El desvio estandar de la serie es de: ",x4))
}
datos_serie(temp3)

# b) ----------------------------------------------------------------------

#quiero una funcion que haga el ingresada una serie N y cantidad de intervalos I
#realice un histograma

histograma_serie <- function(N,I) {
  maximo <- max(N)
  minimo <- min(N)
  ancho <- (maximo - minimo) / I
  histograma <- hist(N, I)
  return(histograma)
}
histograma_serie(temp3,5)
