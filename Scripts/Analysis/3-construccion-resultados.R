# Cargar base de datos
CEP<-readRDS("Data/IntermediateData/CEP-editada.rds")

# ---- 1. ANÁLISIS ESTADÍSTICO DESCRIPTIVO ----

# Tabla 1. Estadísticos Descriptivos índice justificación protestas
tabla1 <- descr(CEP$Protesta, 
                stats = c("min","max","med","mean","q1","q3","sd"), 
                transpose = TRUE,
                style = 'rmarkdown')

# Tabla 2. Frecuencias siemples variable sexo
tabla2 <- freq(CEP$sexo, style = 'rmarkdown')

# Tabla3
tabla3 <- ctable(CEP$NSE, CEP$sexo, style = 'rmarkdown', headings = F)

###### ESTE RESULTADO, SI CARGO LA BASE EN EL RMD Y LO INCLUYO COMO CÓDIGO RESULTA BIEN
###### GUARDANDO COMO OBJETO EN LISTA DESDE ACÁ, NO FUNCIONA BIEN

# ---- 2. GRÁFICOS ----

# Histograma variable "índice justificación protestas" según variable sexo
grafico1 <- ggplot(data = CEP, aes(x = Protesta)) + 
    geom_histogram(fill = "#87CEFA") + 
    ggtitle(label = "Justificacion Protestas") + 
    facet_grid(. ~ sexo) +
    theme_bw()

# Imprimir figura
ggsave(grafico1, filename = "Output/Figura1.png",
       dpi = 350, width = 6, height = 4)

# ---- 3. COMPILAR RESULTADOS EN UN SÓLO OBJETO (LISTA) Y GUARDAR COMO ARCHIVO ----

resultados <- list(tabla1, tabla2, tabla3, grafico1)

saveRDS(resultados, file = "Data/AnalysisData/resultados-reporte.rds")

# Limpiar entorno de trabajo
rm(list=ls())
