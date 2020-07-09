
# Cargar base de datos desde SPSS
CEP_dic2019 <- read_sav("Data/InputData/CEP_dic2019.sav")

# Guardar en formato CSV
write.csv2(CEP_dic2019, file = "Data/IntermediateData/CEP_dic2019.csv")

# Limpiar entorno de trabajo
rm(list=ls())