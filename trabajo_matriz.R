rm(list=ls())

matriz_pp_verano <- matrix(c(28,40,43,130,153.2,152.9,118.9,135.4,127.2), ncol = 3, nrow = 3, byrow = TRUE )
rownames(matriz_pp_verano) <- c("Mendoza","Jujuy","Buenos Aires")
colnames(matriz_pp_verano) <- c("Diciembre","Enero","Febrero")
attach(matriz_pp_verano)
medias <- rowMeans(matriz_pp_verano,dims = 1)

matriz_medias <- matrix(medias, ncol = 1, nrow = 3, byrow = TRUE)
colnames(matriz_medias) <- "Medias"
matriz_pp_total <- cbind(matriz_pp_verano,matriz_medias)
neuquen <- matrix(c(11.3,12.5,11.9,27.8), ncol = 3, nrow = 1, byrow = TRUE)
rownames(neuquen) <- "Neuquen"

neuquen_2 <- cbind(neuquen,rowMeans(neuquen,dims=1))
matriz_3_Final <- rbind(matriz_pp_total,neuquen_2)
