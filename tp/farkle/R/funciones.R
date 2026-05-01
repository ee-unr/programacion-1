#' La función tirar_dados
#'
#' Esta función permite simular la tirada de un número arbitrario de dados legales de seis caras.
#' 
#' @param n entero positivo con el número de dados a ser tirados.
#'
#' @returns vector numérico de largo `n` con el resultado de la tirada.
#'
#' @examples
#' tirar_dados(5)
#' 
#' @export
#' 
tirar_dados = function(n) sample(1:6, n, replace = TRUE)

#' La función mostrar_dados
#' 
#' Esta función muestra los dados resultantes de una tirada.
#'
#' @param tirada vector numérico de largo `n` con la salida de la función `tirar_dados(n)`.
#'
#' @returns vector caracter de largo 1 con el resultado de la tirada.
#'
#' @examples
#' nueva_tirada = tirar_dados(5)
#' mostrar_dados(nueva_tirada)
#' 
#' @export
#' 
mostrar_dados = function(tirada) paste("[", tirada, "]", sep = "", collapse = " ")

#' La función contar_dados
#' 
#' Esta función permite contar cuántos dados de valor `x` salieron en una `tirada`.
#'
#' @param tirada vector numérico de largo `n` con la salida de la función `tirar_dados(n)`.
#' @param x valor entero entre 1 y 6 a ser contado.
#'
#' @returns vector numérico de largo 1 con la cantidad de veces que salió el número `x` en `tirada`.
#'
#' @examples
#' nueva_tirada = tirar_dados(5)
#' mostrar_dados(nueva_tirada)
#' contar_dados(nueva_tirada, 1)
#' 
#' @export
#' 
contar_dados = function(tirada, x) sum(tirada == x)

#' La función limpiar_consola
#' 
#' Una función para limpiar la consola.
#'
#' @returns el objeto `NULL`.
#' 
#' @examples
#' limpiar_consola()
#'
#' @export
#' 
limpiar_consola = function() {
  if (.Platform$OS.type == "windows") {
    shell("cls")
  } else {
    system("clear")
  }
}

#' La función titulo
#' 
#' Esta función imprime una cadena de texto en formato de encabezado.
#'
#' @param texto cadena de texto con el título a mostrar.
#' @param ancho valor numérico con el ancho de las ligas que encierran al título.
#'
#' @returns el objeto `NULL`.
#' 
#' @examples
#' titulo("NUEVA RONDA")
#'
#' @export
#' 
titulo = function(texto, ancho = 70) {
  # imprimir una línea separadora
  linea = function(ancho) {
    cat(paste(rep("#", ancho), collapse = ""), "\n", sep = "")
  }
  cat("\n")
  linea(ancho)
  cat(texto, "\n")
  linea(ancho)
  cat("\n")
}

#' La función texto_lento
#' 
#' Esta función imprime texto lentamente.
#'
#' @param ... cadenas de texto a imprimir.
#' @param pausa valor numérico con el tiempo de impresión por caracter en segundos.
#'
#' @returns el objeto `NULL`.
#' 
#' @details Las cadenas de texto se concatenan con espacios, similar al uso de `cat()`.
#'
#' @examples
#' texto_lento(5, "x", 7, "es igual a", 5*7)
#' texto_lento("Un mensaje demasiado lento", pausa = 0.2)
#' 
#' @export
#' 
texto_lento = function(..., pausa = 0.02) {
  texto = paste(..., collapse = " ")
  caracteres = strsplit(texto, "")[[1]]
  
  for (caracter in caracteres) {
    cat(caracter)
    flush.console()
    Sys.sleep(pausa)
  }
  cat("\n")
}

#' La función pausa
#' 
#' Esta función pausa la ejecución de código hasta que el usuario ingrese la letra (c).
#'
#' @param mensaje cadena de texto con el mensaje a mostrar.
#'
#' @returns el objeto `NULL`.
#' 
#' @examples
#' pausa()
#' 
#' @export
#' 
pausa = function(mensaje = "Pausa del juego.") {
  cat("\n")
  texto_lento(mensaje)
  repeat {
    texto_lento("Ingresa la tecla (c) para continuar.")
    entrada = scan(file = if (interactive()) "" else "stdin", what = character(), n = 1, quiet = TRUE)
    if (tolower(entrada) == "c") {
      break
    } else {
      texto_lento("Entrada invalida. ")
    }
  }
}

#' La función leer_palabra
#'
#' @returns vector caracter de largo 1 con la palabra leída.
#' 
#' @examples
#' leer_palabra()
#'
#' @export
#' 
leer_palabra = function() {
  scan(file = if (interactive()) "" else "stdin", what = character(), n = 1, quiet = TRUE)
}

#' La función leer_opciones
#' 
#' Esta función permite mostrar varias opciones y leer una de ellas.
#'
#' @param titulo cadena de texto que se imprime al inicio.
#' @param ... cadenas de texto con cada una de las opciones.
#'
#' @returns vector numérico de largo 1 con la posición de la opción elegida.
#' 
#' @details el valor de salida respeta el orden en el pasaje de argumentos.
#' 
#' @examples
#' leer_opciones("Quien es el mas grande?", "Central", "Newell's")
#' 
#' @export
#' 
leer_opciones = function(titulo, ...) {
  opciones = c(...)
  largo = length(opciones)
  if (!(largo > 1)) {
    stop("Ingresar al menos dos opciones.")
  }
  posiciones = seq_len(largo)
  respuesta = 0
  texto_lento(titulo)
  texto_lento(paste(paste(paste(" -",posiciones), opciones, sep = ". "), collapse = "\n"))
  while (!(respuesta %in% posiciones)) {
    texto_lento("Ingresa un numero entre (1) y (", largo,"):", sep = "")
    respuesta = scan(file = if (interactive()) "" else "stdin", what = character(), n = 1, quiet = TRUE)
  }
  return(as.integer(respuesta))
}