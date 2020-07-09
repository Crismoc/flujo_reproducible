# Leer desde archivo CSV intermedio
CEP <- read.csv2("Data/IntermediateData/CEP_dic2019.csv")

# ---- 1. RECODIFICAR VARIABLES Y CONSTRUCCIÓN DE UN ÍNDICE ----

# sexo = DS_P1
# NSE = DS_P35

CEP <- rename(CEP, sexo = DS_P1, NSE = DS_P35)

# Etiquetar valores
CEP$sexo <- factor(CEP$sexo, levels =c(1,2), labels = c("Hombre", "Mujer"))
CEP$NSE <- factor(CEP$NSE, levels = c(1,2,3,4,5),
                  labels = c("ABC1", "C2", "C3", "D", "E"))

# Módulo Especial, pregunta 41
# Me gustaría preguntarle sobre acciones que la gente hace para protestar contra algo que le parece injusto.
# ¿Con qué frecuencia usted justificaría o no justificaría las siguientes acciones?
# siempre (1), casi siempre (2), a veces (3), casi nunca (4), nunca (5).

# ESP_41_1 Participar de una marcha como forma de protesta
# ESP_41_2 Evadir el pago del transporte público para protestar cuando su precio sube
# ESP_41_3 Participar de barricadas o destrozos como forma de protesta
# ESP_41_4 Provocar incendios en edificios y locales comerciales como forma de protesta
# ESP_41_5 Participar en saqueos como forma de protesta

# Es la misma recodificación aplicada sobre las 5 variables de interés.
CEP <- mutate(CEP, Marcha = car::recode(CEP$ESP_41_1, "1 = 5; 2 = 4 ; 3 = 3; 4 = 2 ; 5 =1;  88:99=NA"))
CEP <- mutate(CEP, Evasion = car::recode(CEP$ESP_41_2, "1 = 5; 2 = 4 ; 3 = 3; 4 = 2 ; 5 =1;  88:99=NA"))
CEP <- mutate(CEP, Barricada = car::recode(CEP$ESP_41_3, "1 = 5; 2 = 4 ; 3 = 3; 4 = 2 ; 5 =1;  88:99=NA"))
CEP <- mutate(CEP, Incendio = car::recode(CEP$ESP_41_4, "1 = 5; 2 = 4 ; 3 = 3; 4 = 2 ; 5 =1;  88:99=NA"))
CEP <- mutate(CEP, Saqueo = car::recode(CEP$ESP_41_5, "1 = 5; 2 = 4 ; 3 = 3; 4 = 2 ; 5 =1;  88:99=NA"))

# Construir un índice de justificación de la protesta social (en sus diferentes expresiones)
# Promedio simple de variables
CEP <- mutate(CEP, Protesta = (Marcha + Evasion + Barricada + Incendio + Saqueo)/5)

# ---- 2. GUARDAR BASE EDITADA EN FORMATO R ----

# Guardar base en formato RDS, con bases listas para análisis
saveRDS(CEP, file = "Data/IntermediateData/CEP-editada.rds")

# Limpiar entorno de trabajo
rm(list=ls())
