# Capturar los argumentos pasados desde la terminal en un vector
args <- commandArgs(trailingOnly = TRUE)

# Contar cuántos argumentos nos pasaron
cat("Nos pasaron", length(args), "argumentos.\n\n")

# Mostrar los argumentos que nos pasaron
cat("Los argumentos que nos pasaron son:\n")
cat(args, "\n")

# Aunque los argumentos sean números, son tomados como carácter
cat("\nLos argumentos se toman como valores de tipo:\n")
class(args)
