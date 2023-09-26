
# ej 3 p3 -----------------------------------------------------------------

a <- matrix(1:3,ncol = 3,nrow = 3)
b <- matrix(4:6,ncol = 3,nrow = 3)
m <- matrix(,nrow = 3,ncol = 3)
for (i in 1:3) {
  for (j in 1:3) {
    m[i,j] <- sum( a[i,] * b[,j] )
  }
}
m
a %*% b

# b) ----------------------------------------------------------------------

rm(list=ls())
a <- matrix(1:3,ncol = 3,nrow = 3)
b <- matrix(4:6,ncol = 3,nrow = 3)
m <- matrix(,ncol = ncol(a), nrow = nrow(a))
for (i in 1:3) {
  for (j in 1:3) {
    m[i,j] <- a[i,j] * b[i,j]
  }
}
m
a * b

# c) ----------------------------------------------------------------------

rm(list=ls())
a <- matrix(1:100,ncol = 10000,nrow = 10000)
b <- matrix(101:200,ncol = 10000,nrow = 10000)
m <- matrix(,nrow = 3,ncol = 3)
for (i in 1:3) {
  for (j in 1:3) {
    m[i,j] <- sum( a[i,] * b[,j] )
  }
}

for (i in 1:3) {
  for (j in 1:3) {
    m[i,j] <- a[i,j] * b[i,j]
  }
}
#efectivamente r se traba con tanto dato
# d) ----------------------------------------------------------------------
rm(list=ls())
a <- matrix(-1:1,nrow = 3,ncol = 3)
b <- matrix(4:6,nrow = 3,ncol = 3)
m <- matrix(,nrow = nrow(a),ncol = ncol(a))
if (nrow(a) != nrow(b)) {
  print("Las matrices tienen dimensiones diferentes.")
} else if (ncol(a) != ncol(b)) {
  print("las matrices tienen dimensiones diferentes")
} else {
     for (i in 1:3) {
       for (j in 1:3) {
      m[i,j] <- sum( a[i,] * b[,j] )
    }
  }
}

# e) ----------------------------------------------------------------------

rm(list=ls())
a <- matrix(-1:1,nrow = 3,ncol = 3)
b <- matrix(4:6,nrow = 3,ncol = 3)
m <- matrix(,nrow = nrow(a),ncol = ncol(a))
if (nrow(a) != nrow(b)) {
  print("Las matrices tienen dimensiones diferentes.")
} else if (ncol(a) != ncol(b)) {
  print("las matrices tienen dimensiones diferentes")
} else {
  for (i in 1:3) {
    for (j in 1:3) {
      m[i,j] <- sum( a[i,] * b[,j] )
      if ( m[i,j] < 0 ) {
        m[i,j] <- 0
      } else {
        m[i,j] <- m[i,j]
      }
    }
  }
}
