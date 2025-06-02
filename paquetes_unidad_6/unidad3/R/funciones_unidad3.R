#' Suma de una secuencia de números enteros
#'
#' @description
#' Calcula la suma de un rango de números enteros, incluyendo los extremos.
#'
#' @param a,b números enteros
#'
#' @return suma de la secuencia
#'
#' @export
#'
#' @examples
#' suma_secuencia(1, 3)
#' suma_secuencia(-2, 3)
#' suma_secuencia(-3, -5)
#' suma_secuencia(3, 3)
#'
suma_secuencia <- function(a, b) {
  suma <- 0
  for (i in a:b) {
    suma <- suma + i
  }
  return(suma)
}


#' Clasificación de un triángulo
#'
#' @description
#' Clasifica a un triángulo según las longitudes de sus lados, en escaleno, isósceles
#' o equilátero.
#'
#' @details
#' Se evalúa la desigualdad triangular. Si las medidas de los lados no corresponden
#' a un triángulo, la función devuelve "no es un triángulo".
#'
#' @param a,b,c números reales positivos
#'
#' @return valor carácter que indica el tipo de triángulo.
#'
#' @export
#'
#' @examples
#' triangulos(2, 3, 4)
#' triangulos(2, 3, 10)
#'
triangulos <- function(a, b, c) {
  if (a > b + c || b > a + c || c > a + b) {
    return("no es triángulo")
  } else if (a == b & a == c) {
    return("equilátero")
  } else if (a == b || a == c || b == c) {
    return("isósceles")
  } else {
    return("escaleno")
  }
}


#' Punto dentro de la elipse
#'
#' @description
#' Determina si un punto está contenido dentro de la elipse definida por la fórmula
#' (x - 6)^2 / 36 + (y + 4)^2 / 16 = 1
#'
#' @details
#' Por defecto se evalúa al origen de coordenadas.
#'
#' @param x,y coordenadas, números reales. Por defecto valen 0.
#'
#' @return valor lógico indicando si el punto está dentro de la elipse descripta.
#'
#' @export
#'
#' @examples
#' elipse(3, 7)
#' elipse(6, -4)
#' elipse()
#'
elipse <- function(x = 0, y = 0) {
  valor <- (x - 6)^2 / 36 + (y + 4)^2 / 16
  return(valor <= 1)
}


#' Suma de fila de la pirámide
#'
#' @description
#' La pirámide se arma con números impares, empezando con el 1 en la cima, el 3 y 5
#' en la segunda fila, y así sucesivamente. Devuelve la suma de los números ubicados
#' en la fila ingresada.
#'
#' @details
#' Se puede demostrar que la suma de los números en la n-ésima fila es igual a
#' n al cubo.
#'
#' @param n Número natural
#'
#' @return suma de los números ubicados en la n-ésima fila de la pirámide.
#'
#' @export
#'
#' @examples
#' suma_piramide(1)
#' suma_piramide(2)
#' suma_piramide(3)
#'
suma_piramide <- function(n) {
  return(n^3)
}
