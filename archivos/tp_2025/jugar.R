#-------------------------------------------------------------------------------
#       PROGRAMACIÓN 1 - TRABAJO PRÁCTICO - AÑO 2025
#-------------------------------------------------------------------------------
# 
# EQUIPO Nº xx:
# 
# - Apellido, nombre
# - Apellido, nombre
# - Apellido, nombre
# - Apellido, nombre
#
# ARCHIVO: jugar.R
#
# Este archivo debe ser ejecutado desde una terminal con la instrucción Rscript
# jugar.R, desde el directorio en el que esté guardado junto con cualquier otro
# archivo que sea creado como parte de la solución.
# 
# Agregar aquí cualquier comentario que consideren importante sobre la
# resolución del TP o sobre este archivo de código.
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Paquete "memoria"
#-------------------------------------------------------------------------------

# El paquete "memoria" ofrece funciones auxiliares que simplifican muchas partes
# de la solución de este trabajo. Se recomienda leer la documentación con
# atención y correr los ejemplos.
# Las líneas de código que se encargan de la instalación del paquete no deben
# quedar en este script, pero sí la sentencia library para cargarlo.

# Instalación
# install.packages("pak")
# pak::pkg_install("ee-unr/programacion-1/tp/memoria")
library("memoria")

#-------------------------------------------------------------------------------
# Variable global para especificar de dónde se toman los inputs del usuario.
#-------------------------------------------------------------------------------

# Esta línea se puede dejar como está y usar esta variable como argumento para
# la función leer_eleccion() o para la función scan(). Esto hace que el programa
# se pueda ejecutar tanto desde la terminal como desde la consola de R en RStudio.

file <- ifelse(interactive(), "", "stdin")

#-------------------------------------------------------------------------------
# Variable global para especificar las fichas que se usan como default
#-------------------------------------------------------------------------------

# Se pueden ofrecer estas u otras fichas como default
fichas <- c("α", "β", "δ")

#-------------------------------------------------------------------------------
# Definición de funciones propias.
# Se pueden escribir acá o en otro script .R y cargarlo con source()
# No olvidarse de documentar las nuevas funciones escritas.
# Puede ser una buena idea crear una función para cada parte del juego o para
# cada tarea que haya que realizar
#-------------------------------------------------------------------------------

# COMPLETAR

#-------------------------------------------------------------------------------
# Programa principal
#-------------------------------------------------------------------------------

# COMPLETAR
