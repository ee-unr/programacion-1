#' Generador de nombre de usuario y contraseña segura
#'
#' Esta función genera un nombre de usuario y una contraseña combinando partes
#' del nombre, apellido y un número, incluyendo un número aleatorio.
#'
#' @param codigo Entero de dos cifras. Número que se usará en el cálculo de la contraseña.
#' @param nombre Caracter. Nombre del usuario. Por defecto es `"silvina"`.
#' @param apellido Caracter. Apellido del usuario. Por defecto es `"perez"`.
#'
#' @return Una lista con dos elementos:
#' \describe{
#'   \item{nombre_usuario}{El nombre de usuario en formato `nombre_apellido`, todo en minúsculas.}
#'   \item{contraseña}{Una cadena que conforma una contraseña creada con los datos aportados}
#' }
#'
#' @details
#' La contraseña se construye de la siguiente manera:
#' \itemize{
#'   \item 3 primeras letras del apellido (minúsculas)
#'   \item cantidad de vocales del nombre multiplicada por la cantidad de consonantes del apellido
#'   \item 2 primeras letras del nombre
#'   \item código multiplicado por un número aleatorio del 1 al 10
#' }
#'
#' Se imprime un mensaje indicando que la contraseña fue generada correctamente.
#'
#' @examples
#' generar_clave(42, "Juan", "Martinez")
#' generar_clave(32)
#'
#' @export
generar_clave <- function(codigo, nombre = "silvina", apellido = "perez") {
  if(!(codigo %% 1 == 0 && codigo < 100 && codigo > 9)){
    stop("El código no es válido.")
  }
  nombre <- tolower(nombre)
  apellido <- tolower(apellido)

  letras_nombre <- strsplit(nombre, "")[[1]]
  letras_apellido <- strsplit(apellido, "")[[1]]

  # se podria usar funciones como chartr para eliminar acentos, diéreisis, etc, pero no nos fijemos en eso
  n_vocales_nombre <- sum(letras_nombre %in% c("a", "e", "i", "o", "u"))
  n_conson_apellido <- length(letras_apellido) - sum(letras_apellido %in% c("a", "e", "i", "o", "u"))


  primeras_3_apellido <- substr(apellido, 1, 3)
  prod <- n_vocales_nombre * n_conson_apellido
  primeras_2_nombre <- substr(nombre, 1, 2)
  numero_azar <- sample(1:10, 1)
  prod_codigo <- codigo * numero_azar
  clave <- paste0(primeras_3_apellido, prod, primeras_2_nombre, prod_codigo)

  nombre_usuario <- paste(nombre, apellido, sep = "_")

  message("¡La contraseña se ha generado correctamente!")

  return(list(nombre_usuario = nombre_usuario, contraseña = clave))
}
