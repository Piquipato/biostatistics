
# Importamos datos del archivo que los contiene
datos <- read.table("C:/Users/geneticalapaz/Documents/plalanda/bioestadistica/datos2dOrig.txt", header = TRUE, sep = "", dec = ".")

head(datos)

# Creamos nueva variable para calcular el NAT
datos$NAT = datos$HTA + datos$DISLIPEMIA + datos$GLUCEMIA + datos$DE + datos$LDLox + datos$FUMA + datos$CCI

head(datos)

# Control Flow en R, con NAT2c (1='<=2' y 2='>2')
datos$NAT2c = ifelse(datos$NAT <= 2, 1, 2)

head(datos)

# Convertimos en formato fecha los valores numéricos obtenidos del excel
datos$F_INI_TXT = as.Date(datos$F_INI, origin = "1899-12-30")

# Convertimos las variables nominales y añadimos las etiquetas
datos$SEXO_TXT = factor(datos$SEXO, levels = c(0,1), labels = c('Mujer', 'Hombre'), ordered = FALSE)

head(datos)
# Fíjate bien que los valores de las etiquetas llevan comillas
# Las variables continuas no hay que definirlas

# Ejercicio 4 en R
# Crear Variables

datos$CAMBIO = datos$P2 - datos$P0
datos$SEGUIMIENTO = datos$F_FIN - datos$F_INI
datos$TCAMBIO = ifelse(is.na(datos$F_10K), NA, datos$F_10K - datos$F_INI)
#Aquí me faltan dos variables lol

# Ejercicio 5 en R
# Variable condicional

datos$PCAMBIO = ifelse(datos$CAMBIO > -10, 0, 1)
#Me faltan otras dos cosas aquí

# Ejercicio 6 en R
# Labels en TXT
datos$F_FIN_TXT = as.Date(datos$F_FIN, origin = "1899-12-30")
datos$TRT_TXT = factor(datos$TRATAMIENTO, levels = c(0,1), labels = c('NO', 'SÍ'), ordered = FALSE)

head(datos)





