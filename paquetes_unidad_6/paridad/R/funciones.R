#' Números pares de un vector
#'
#' Esta función toma un vector de números y devuelve un nuevo vector que
#' contiene solo los pares.
#'
#' @param x Un vector numérico
#' @return Un vector con los números pares
#' @details Si `x` no es un vector numérico, se produce un error.
#' @export
#' @examples
#' numeros_pares(c(-1, 4, 4.1, 0, 6))
#' numeros_pares(10:15)
#' numeros_pares(1)
#'
numeros_pares <- function(x) {
  if (!is.numeric(x)) {
    stop("x debe ser un vector numérico.")
  }
  return(x[x %% 2 == 0])
}

#' Números impares de un vector
#'
#' Esta función toma un vector de números y devuelve un nuevo vector que
#' contiene solo los impares.
#'
#' @param x Un vector numérico
#' @return Un vector con los números pares
#' @details Si `x` no es un vector numérico, se produce un error.
#' @export
#' @examples
#' numeros_impares(c(-1, 4, 4.1, 0, 6))
#' numeros_impares(10:15)
#' numeros_impares(-2)
#'
numeros_impares <- function(x) {
  if (!is.numeric(x)) {
    stop("x debe ser un vector numérico.")
  }
  return(x[x %% 2 == 1])
}
