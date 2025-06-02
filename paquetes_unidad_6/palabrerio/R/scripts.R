#' Verificación de última letra
#'
#' Esta función devuelve TRUE si la última letra en una cadena de texto es vocal.
#'
#' @param palabra Una cadena de texto
#' @return TRUE si termina en vocal, FALSE si no
#' @details Si `palabra` no es una cadena de texto, se produce un error.
#' @examples
#' termina_en_vocal("casa")
#' termina_en_vocal("montes")
#'
termina_en_vocal <- function(palabra) {
  stopifnot(is.character(palabra) && length(palabra) == 1)
  letras <- strsplit(palabra, "")[[1]]
  ultima <- letras[length(letras)]
  return(ultima %in% c("a", "e", "i", "o", "u"))
}

#' Filtro según última letra
#'
#' Esta función recibe un vector de palabras y devuelve sólo aquellas que
#' terminan en vocal.
#'
#' @param palabras Vector de palabras
#' @details Si `palabras` no es un vector carácter, se produce un error.
#' @return Subconjunto de palabras que terminan en vocal
#' @export
#' @examples
#' x <- c("casa", "flor", "pared", "día", "sol")
#' filtrar_por_vocal(x)
#' filtrar_por_vocal(c("montes", "cuadernos"))
#'
filtrar_por_vocal <- function(palabras) {
  if (!is.character(palabras)) {
    stop("palabra debe ser un vector carácter.")
  }
  return(palabras[sapply(palabras, termina_en_vocal)])
}


