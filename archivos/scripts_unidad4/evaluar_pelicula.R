cat("\n===============================================\n")
cat("\n      SISTEMA DE EVALUACIÓN DE PELÍCULAS\n")
cat("\n===============================================\n\n")

cat("Ingrese la cantidad de jueces en el grupo:\n")
n <- scan(file = "stdin", what = integer(), n = 1, quiet = TRUE)

if (n < 3 || n > 6) {
  cat("Cantidad inválida de jueces. Debe ser entre 3 y 6.\n")
} else {
  cat("\nIngrese el nombre de la película:\n")
  nombre <- scan(file = "stdin", what = character(), n = 1, quiet = TRUE)
  suma <- 0
  for (i in 1:n) {
    cat("\nIngrese la calificación del juez ", i, ":\n", sep = "")
    nota <- scan(file = "stdin", what = numeric(), n = 1, quiet = TRUE)
    while (nota < 0 || nota > 10) {
      cat("Calificación inválida. Las calificaciones deben ser entre 1 y 10.\nIngrésela nuevamente:\n")
      nota <- scan(file = "stdin", what = numeric(), n = 1, quiet = TRUE)
    }
    suma <- suma + nota
  }
  promedio <- suma / n
  cat(
    "\nLa clasificación promedio para la película <", nombre, "> es ",
    round(promedio, 2), " puntos.\n\n", sep = ""
  )
}
