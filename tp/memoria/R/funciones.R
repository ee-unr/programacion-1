#' Determinar las dimensiones de una matriz a partir de una cantidad de elementos
#'
#' Calcula dimensiones preferentemente cuadradas para una matriz que contenga
#' una cantidad determinada de elementos. Si no es posible obtener una matriz
#' cuadrada exacta, se prefiere una forma más ancha que alta.
#'
#' @param l Cantidad total de elementos.
#'
#' @return Un vector numérico de longitud 2 con el número de filas y columnas.
#' @keywords internal
dimensionar <- function(l) {
  a <- 2
  while (TRUE) {
    d <- l / a
    r <- l %% a
    if(r == 0 & d <= a) break
    a <- a + 1
  }
  return(c(d, a))
}

#' Crear un nuevo tablero con pares de fichas mezcladas aleatoriamente
#'
#' Genera una matriz con pares de fichas dispuestas en orden aleatorio. Las
#' fichas se duplican y se organizan en forma matricial.
#'
#' @param fichas Vector de caracteres con las fichas únicas.
#' @param semilla Entero opcional para fijar la semilla de aleatorización, para
#'   que el tablero luzca siempre igual (no debe ser usado en la versión final).
#'
#' @return Una matriz con las fichas dispuestas en posiciones aleatorias. Las
#'   dimensiones se eligen automáticamente.
#' @export
#'
#' @examples
#' fichas <- c("a", "b", "c")
#' tablero <- nuevo_tablero(fichas)
#' tablero
#'
nuevo_tablero <- function(fichas, semilla = NULL) {
  fichas <- as.character(fichas)
  l <- 2 * length(fichas)
  if (!is.null(semilla)) set.seed(semilla)
  tablero <- sort_by(rep(fichas, 2), stats::runif(l))
  dims <- dimensionar(l)
  dim(tablero) <- dims
  dimnames(tablero) <- list(
    paste0("F",seq_len(dims[1])),
    paste0("C",seq_len(dims[2]))
  )
  return(tablero)
}

#' Validar un conjunto de fichas ingresadas
#'
#' Verifica que la cantidad de fichas sea suficiente y que no haya fichas duplicadas.
#'
#' @param fichas Vector de caracteres con las fichas ingresadas.
#' @param n Número de fichas requerido.
#'
#' @return TRUE si las fichas son válidas, FALSE en caso contrario.
#' @export
#'
#' @examples
#' fichas <- c("a", "b", "c")
#' validar_fichas(fichas, 4)
#' validar_fichas(fichas, 3)
#' fichas <- c("a", "b", "c", "c")
#' validar_fichas(fichas, 4)
#'
validar_fichas <- function(fichas, n) {
  if (length(fichas) < n) {
    cat("Ha ingresado menos de ", n, " fichas.\n", sep = "")
    return(FALSE)
  }
  if (any(duplicated(fichas))) {
    cat("Ha ingresado fichas repetidas.\n", sep = "")
    return(FALSE)
  }
  return(TRUE)
}

#' Mostrar el tablero con fichas ocultas o reveladas
#'
#' Imprime el tablero en la consola, ocultando las fichas no seleccionadas y mostrando aquellas indicadas.
#'
#' @details
#' Esta función limpia la consola antes de imprimir.
#'
#' @param tablero Matriz generada por \code{nuevo_tablero()}.
#' @param mostrar Vector numérico con las posiciones de las fichas a mostrar. Estas posiciones se corresponden con los números de fichas que se ven al mostrar el tablero en la consola. No se requiere indexar fila y columna, sólo proveer el número de ficha.
#'
#' @return No devuelve valor. Imprime el tablero formateado en consola.
#' @export
#'
#' @examples
#' fichas <- c("a", "b", "c")
#' tablero <- nuevo_tablero(fichas)
#' mostrar_tablero(tablero)
#' mostrar_tablero(tablero, mostrar = c(2, 6))
mostrar_tablero <- function(tablero, mostrar = NULL) {

  # notas del autor
  # NOTA 1: la funcion limpia la consola antes de imprimir el tablero
  # NOTA 2:
  #   - la matriz se indexa con el vector en el que se desdobla
  #   - m[1,1] == m[1], y m[I,J] == m[length(m)]
  #   - en forma general m[i,j] <- m[(j-1)*nrow(m) + i]
  #   - los chicos no tienen que saber nada de esto
  #   - porque la posicion se imprime en el tablero
  #   - ver mostrar_tablero(nuevo_tablero(c("a","b","c")))
  # NOTA 3:
  #   - las fichas pueden ser de distinto largo porque
  #   - knitr::kable() se encarga de alinear la salida

  pos <- seq_len(length(tablero)) # posiciones validas
  if (!all(mostrar %in% pos)) {
    stop("(mostrar) debe ser subconjunto de c(", paste(pos, collapse = ","),")")
  }
  tapar <- setdiff(pos, mostrar)
  tablero[tapar] <- paste0("(",tapar,")")
  limpiar_consola()
  cat("TABLERO:")
  print(knitr::kable(tablero, format = "pipe", align = "c"))
  cat("\n")
}


#' Mostrar un texto carácter por carácter con retardo
#'
#' Imprime un texto en la consola, revelando cada carácter con un pequeño
#' retardo.
#'
#' @param s Cadena de texto a imprimir.
#' @param t Tiempo de espera entre caracteres (en segundos).
#'
#' @return No devuelve valor. Efecto visual en consola.
#' @keywords internal
#'
str_timer <- function(s, t = 0.05){
  chars <- unlist(strsplit(x = s, split = ""))
  for (k in chars){
    cat(k)
    Sys.sleep(t)
  }
  cat("\n")
}

#' Imprimir texto lentamente en la consola
#'
#' Imprime cada línea de texto de forma pausada, carácter por carácter.
#'
#' @param texto Vector o lista de cadenas de texto a imprimir. Puede ser una
#' sola cadena de texto.
#'
#' @return No devuelve valor. Efecto visual en consola.
#' @export
#'
#' @examples
#' texto_lento("Hola... ¿Estás listo para jugar?")
#'
texto_lento <- function(texto) {
  purrr::walk(texto, str_timer)
}

#' Limpiar la consola
#'
#' Limpia el contenido de la consola, compatible con sistemas Windows y Unix.
#'
#' @return No devuelve valor.
#' @export
#'
#' @examples
#' limpiar_consola()
#'
limpiar_consola <- function() {
  if (Sys.info()[["sysname"]] == "Windows") {
    shell("cls")
  } else {
    system("clear")
  }
}

#' Leer una elección del usuario desde consola
#'
#' Solicita al usuario ingresar una opción válida desde teclado. Repite el
#' pedido si la entrada no es válida.
#'
#' @param valores_permitidos Vector de valores válidos que el usuario puede
#' ingresar. Puede ser un vector numérico o carácter.
#' @param mensaje Mensaje opcional a mostrar al usuario antes de solicitarle su
#' elección
#' @param file Cadena de texto para especificar desde dónde se toma la entrada
#' del usuario: "" si el programa se corre en la consola de R en RStudio o
#' "stdin" si el programa se corre desde la terminal.
#'
#' @return El valor ingresado por el usuario. Su tipo coincide con el tipo de
#'  `valores_permitidos`.
#' @export
#'
#' @examples
#' # leer_eleccion(1:3)  # Solo si se ejecuta interactivamente
#'
leer_eleccion <- function(valores_permitidos, mensaje = NULL, file = "") {
  tipo_numerico <- is.numeric(valores_permitidos)
  valores_permitidos <- as.character(valores_permitidos)
  if (is.null(mensaje)) {
    mensaje <- "Ingresá tu elección y presioná ENTER: "
  }
  cat("\n", mensaje, "\n\n", sep = "")
  opcion <- scan(what = character(), n = 1, quiet = T, file = file, sep = "%")
  while (length(opcion) == 0 || is.na(opcion) || (!opcion %in% valores_permitidos)) {
    cat("\nEl valor ingresado no es válido\n")
    cat("\n", mensaje, "\n\n")
    opcion <- scan(what = character(), n = 1, quiet = T, file = file, sep = "%")
  }
  return(ifelse(tipo_numerico, as.numeric(opcion), opcion))
}



#' Mostrar información del estado actual de la partida
#'
#' Imprime información útil sobre la partida actual, incluyendo la ronda, pares formados y pares restantes.
#'
#' @param tablero Matriz de fichas generada por \code{nuevo_tablero()}.
#' @param afuera Vector de posiciones (enteros) que ya fueron descubiertas.
#' @param ronda Número de ronda actual.
#'
#' @return No devuelve valor. Imprime información en consola.
#' @export
#'
#' @examples
#' fichas <- c("a", "b", "c")
#' tablero <- nuevo_tablero(fichas, semilla = 1)
#' mostrar_tablero(tablero)
#' mostrar_tablero(tablero, mostrar = c(2, 6))
#' mostrar_info(tablero, afuera = c(2, 6), ronda = 1)
#'
mostrar_info <- function(tablero, afuera, ronda) {
  disponibles <- setdiff(seq_len(length(tablero)), afuera)

  # mostrar informacion de la ronda
  cat("INFORMACIÓN DE LA PARTIDA:\n")
  cat(" - Ronda:", ronda, "\n")
  cat(" - Pares armados:", mostrar_pares(sort(unique(tablero[afuera]))), "\n")
  cat(" - Faltan armar:", mostrar_pares(sort(unique(tablero[disponibles]))))
  cat("\n\n")
}


#' Obtener posiciones disponibles en el tablero
#'
#' Devuelve las posiciones que aún no han sido descubiertas.
#'
#' @param tablero Tablero de fichas.
#' @param afuera Vector numérico de posiciones que ya han sido descubiertas.
#'
#' @return Vector numérico con las posiciones aún disponibles.
#' @export
#'
#' @examples
#' fichas <- c("a", "b", "c")
#' tablero <- nuevo_tablero(fichas, semilla = 1)
#' mostrar_tablero(tablero, mostrar = c(2, 6))
#' posiciones_disponibles(tablero, afuera = c(2, 6))
#'
posiciones_disponibles <- function(tablero, afuera) {
  setdiff(seq_len(length(tablero)), afuera)
}

#' Generar texto con pares de fichas
#'
#' Crea un vector de cadenas con la forma (ficha, ficha) para cada ficha del vector.
#'
#' @param fichas Vector de caracteres con fichas únicas.
#'
#' @return Vector de texto con pares formateados.
#' @export
#'
#' @examples
#' fichas <- c("a", "b", "c")
#' mostrar_pares(fichas)
#'
mostrar_pares <- function(fichas = character()) {
  pares <- character()
  for (k in fichas) {
    pares <- c(pares, paste0("(", k, ",", k, ")"))
  }
  return(pares)
}
