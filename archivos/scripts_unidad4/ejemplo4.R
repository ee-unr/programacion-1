# Capturar los argumentos pasados desde la terminal en un vector
args <- commandArgs(trailingOnly = TRUE)

# Si no proveyó argumentos, generar un error y que se detenga el programa
if (length(args) == 0) {
  stop("Debe proveer al menos un argumento (chiste o refran).")
}

# Si proveyó más de 2 argumentos, generar un error y que se detenga el programa
if (length(args) > 2) {
  stop("No debe proveer más de 2 argumentos. El primero es obligatorio (chiste o refran) y el segundo es opcional (un número que indica la cantidad de veces a repetir el chiste o el refrán).")
}

# Si no hay segundo argumento, args[2] es NA
if (is.na(args[2])) {
  n <- 1
} else {
  n <- as.numeric(args[2])
}

# Repetir n veces
for (i in 1:n) {
  if (args[1] == "chiste") {
    cat("- Juan, cómo has cambiado.\n- Yo no soy Juan.\n- Más a mi favor.\n\n")
  } else if (args[1] == "refran") {
    cat("No por mucho madrugar amanece más temprano.\n\n")
  } else {
    # Genero un error para que el programa se detenga, avisando lo que pasa
    stop("El argumento provisto debe ser igual a chiste o refran.\n")
  }
}
