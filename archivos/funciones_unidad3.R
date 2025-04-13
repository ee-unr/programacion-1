#' Cálculo de factoriales
#' 
#' @description
#' Calcula el factorial de números enteros no negativos.
#'
#' @details 
#' Produce un error si se quiere calcular el factorial de un número negativo.
#' 
#' @param n Número entero no negativo para el cual se calcula el factorial.
#'
#' @return El factorial de n.
#'
#' @examples
#' fact(5)
#' fact(0)
#' 
fact <- function(n) {
  if (n < 0 || n != floor(n)) {
    stop("n debe ser entero no negativo.")
  }
  resultado <- 1
  if (n > 0) {
    for (i in 1:n) {
      resultado <- resultado * i
    }
  }
  return(resultado)
}