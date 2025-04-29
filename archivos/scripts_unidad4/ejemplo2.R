# Capturar los argumentos pasados desde la terminal en un vector
args <- commandArgs(trailingOnly = TRUE)

if (args[1] == "chiste") {
  cat("- Juan, cómo has cambiado.\n- Yo no soy Juan.\n- Más a mi favor.\n\n")
} else if (args[1] == "refran") {
  cat("No por mucho madrugar amanece más temprano.\n\n")
} else {
  # Genero un error para que el programa se detenga, avisando lo que pasa
  stop("El argumento provisto debe ser igual a chiste o refran.\n")
}
