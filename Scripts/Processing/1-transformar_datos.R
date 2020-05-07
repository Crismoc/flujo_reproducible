# Cargar paquetes
pacman::p_load(dplyr, # transformar datos
               tibble, # bases de datos tidyverse
               summarytools) # resumenes de información

# Cargar datos
pinochet <- readRDS("Data/InputData/pinochet.Rds")

# Revisar documentación datos
?pinochet::pinochet

# Transformar a formato de base de datos tibble de Tidyverse
pinochet <- as.tibble(pinochet) # formato de base de datos tidyverse

# Revisar datos
dim(pinochet)
str(pinochet)
glimpse(pinochet)
summary(pinochet)

head(pinochet)


# 1. Filtrar

## Filtra los datos para dejar a los hombres 
## con casos no resueltos (violence == "Unresolved")
hmb_nrs <- pinochet %>% 
    filter(male == ___) %>%  #<<
    filter(violence == ___) #<<
dim(hmb_nrs) # Revisar cuántos casos son

# 2. Ordenar

## Ordenar los datos de forme descendente por fecha 
## de fin (end_date_daily)
pinochet %>% 
    arrange(_____)

# 3. Seleccionar columnas
## Seleccionar las columnas indivdual_id, age y occupation
pinochet %>% 
    select(___)

# 4. Transformar columnas
## Crea una variable dummy para quienes eran
## estudiantes universitarios (occupation == "University Student")
pinochet <- pinochet %>% 
    mutate(est_univ = ifelse(occupation == ___, 1, 0))

## Revisa la tabla de frecuencia
freq(pinochet$est_univ)
