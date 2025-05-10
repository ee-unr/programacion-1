opcion <- 0

while (opcion != 3) {
  cat("\n=== MENÚ PRINCIPAL ===\n\n")
  cat("1. Saludar\n")
  cat("2. Mostrar hora actual\n")
  cat("3. Salir\n\n")
  cat("Elegí una opción: ")
  
  opcion <- scan(file = "stdin", what = integer(), n = 1, quiet = TRUE)
  
  if (opcion == 1) {
    cat("\nIngresá tu nombre: ")
    nombre <- scan(file = "stdin", what = character(), n = 1, quiet = TRUE)
    cat("¡Hola, ", nombre, "!\n", sep = "")
    
  } else if (opcion == 2) {
    hora <- format(Sys.time(), "%H:%M:%S")
    cat("\nLa hora actual es:", hora, "\n")
    
  } else if (opcion == 3) {
    cat("\nIngresá tu nombre para despedirte: ")
    nombre <- scan(file = "stdin", what = character(), n = 1, quiet = TRUE)
    cat("¡Chau, ", nombre, "!\n", sep = "")
    
  } else {
    cat("\nOpción inválida. Probá de nuevo.\n")
  }
}
