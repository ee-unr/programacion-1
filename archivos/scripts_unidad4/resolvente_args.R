# Mensaje de bienvenida
cat("=========================================\n")
cat("  Calculadora de ecuaciones cuadráticas\n")
cat("=========================================\n")

# Capturar los argumentos pasados desde la terminal en un vector
args <- commandArgs(trailingOnly = TRUE)

# Si no proveyó suficientes argumentos, generar un error y que se detenga el programa
if (length(args) < 3) {
  stop("Debe proveer tres valores para los coeficientes de la ecuación.")
}

# Convertir a numérico todos los argumentos
a <- as.numeric(args[1])
b <- as.numeric(args[2])
c <- as.numeric(args[3])

# Si alguno no era numérico, no se pudo convertir y es NA
if (is.na(a) || is.na(b) || is.na(c)) {
  stop("Los argumentos ingresados no son valores numéricos.")
}

# Si a = 0, genera un error y se detiene
if (a == 0) {
  stop("Error: el coeficiente 'a' debe ser distinto de cero. Fin del programa.\n")
}

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
