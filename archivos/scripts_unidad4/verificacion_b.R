cat("\n==================================================\n")
cat("\n  BIENVENIDO/A AL AULA VIRTUAL DE PROGRAMACIÓN 1  \n")
cat("\n==================================================\n\n")

contrasenia_correcta <- "amoprogramar"
ingresada <- ""
intentos_restantes <- 5

while (intentos_restantes > 0 && ingresada != contrasenia_correcta) {
  cat("\nIngrese la contraseña:\n")
  ingresada <- scan(file = "stdin", what = character(), nmax = 1, quiet = TRUE)
  
  if (ingresada != contrasenia_correcta) {
    intentos_restantes <- intentos_restantes - 1
    if (intentos_restantes > 0) {
      cat("Contraseña incorrecta. Intentos restantes:", intentos_restantes, "\n")
    } else {
      cat("\nDemasiados intentos fallidos. Su cuenta ha sido bloqueada.\n\n")
    }
  }
}

if (ingresada == contrasenia_correcta) {
  cat("\n¡Contraseña correcta! Puede ingresar y continuar con sus estudios.\n\n")
}
