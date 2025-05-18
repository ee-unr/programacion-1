# Mensaje de bienvenida
cat("=========================================\n")
cat("  Calculadora de ecuaciones cuadráticas\n")
cat("=========================================\n\n")

# Leer coeficientes desde la terminal
cat("Ingrese el valor del coeficiente 'a':\n")
a <- scan(file = "stdin", n = 1, quiet = TRUE)
if (a == 0) {
  stop("El coeficiente 'a' debe ser distinto de cero. Fin del programa.\n")
}
cat("Ingrese el valor del coeficiente 'b':\n")
b <- scan(file = "stdin", n = 1, quiet = TRUE)
cat("Ingrese el valor del coeficiente 'c':\n")
c <- scan(file = "stdin", n = 1, quiet = TRUE)

# Mostrar la ecuación de forma legible
ecuacion <- paste0(a, "x²", ifelse(b < 0, "", "+"), b, "x", ifelse(c < 0, "", "+"), c, "=0")
cat("\nEcuación ingresada: ", ecuacion, "\n")

# Calcular el discriminante
D <- b^2 - 4 * a * c
cat("Discriminante (D):", round(D, 3), "\n")

# Calcular soluciones
if (D > 0) {
  x1 <- (-b - sqrt(D)) / (2 * a)
  x2 <- (-b + sqrt(D)) / (2 * a)
  cat("Existen dos soluciones reales distintas:\n")
  cat("x₁ =", round(x1, 3), ", x₂ =", round(x2, 3), "\n")
} else if (D == 0) {
  x <- -b / (2 * a)
  cat("Existe una única solución real (raíz doble):\n")
  cat("x =", round(x, 3), "\n")
} else {
  cat("Las soluciones son complejas (no reales).\n")
}

# Mensaje de despedida
cat("\nGracias por usar la calculadora de ecuaciones cuadráticas.\n")
