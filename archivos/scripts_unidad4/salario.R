# PROGRAMA: "Determinar salario"

# Valores fijados
valor_hora <- 4000
valor_adicional_noche <- 2000
valor_adicional_domingo <- 1000

# Pedir valores para calcular el salario
cat("Ingrese la cantidad de horas trabajadas:\n")
horas <- scan("stdin", n = 1, quiet = TRUE)
cat("\nIngrese el día de la semana (DOM LUN MAR MIE JUE VIE SAB):\n")
dia <- scan("stdin", what = "", n = 1, quiet = TRUE)
cat("\nIngrese el turno (M T N):\n")
turno <- scan("stdin", what = "", n = 1, quiet = TRUE)

# Cálculo para el pago de ese día a ese empleado
salario <- horas * valor_hora
if (turno == "N") {
  salario <- salario + horas * valor_adicional_noche
}
if (turno == "DOM") {
  salario <- salario + horas * valor_adicional_domingo
}
cat("\nEl salario que se debe abonar es $", salario, "\n", sep = "")
