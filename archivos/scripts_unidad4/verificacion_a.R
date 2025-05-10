cat("\n==================================================\n")
cat("\n  BIENVENIDO/A AL AULA VIRTUAL DE PROGRAMACIÓN 1  \n")
cat("\n==================================================\n\n")

contrasenia_correcta <- "amoprogramar"
ingresada <- ""

while (ingresada != contrasenia_correcta) {
  cat("\nIngrese la contraseña:\n")
  ingresada <- scan(file = "stdin", what = character(), n = 1, quiet = TRUE)
  if (ingresada != contrasenia_correcta) {
    cat("Contraseña incorrecta. Ingrésela nuevamente.\n")
  }
}

cat("\n¡Contraseña correcta! Puede ingresar y continuar con sus estudios.\n\n")
