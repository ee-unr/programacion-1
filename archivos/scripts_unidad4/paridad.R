cat("==========================================\n")
cat("           PARIDAD DE UN NÚMERO           \n")
cat("==========================================\n\n")
cat("Ingrese un número entero y presione enter:\n")
n <- scan(file = "stdin", n = 1, quiet = TRUE)
if (n %% 2 == 0) {
  cat(n, "es par\n")
} else {
  cat(n, "es impar\n")
}
