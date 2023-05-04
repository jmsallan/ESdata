library(tidyverse)

read_ipc <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}
ipc_dates <- function(table){
  table <- table %>% mutate(periodo = gsub("M01", "-01-31", periodo))
  table <- table %>% mutate(periodo = gsub("M02", "-02-28", periodo))
  table <- table %>% mutate(periodo = gsub("M03", "-03-31", periodo))
  table <- table %>% mutate(periodo = gsub("M04", "-04-30", periodo))
  table <- table %>% mutate(periodo = gsub("M05", "-05-31", periodo))
  table <- table %>% mutate(periodo = gsub("M06", "-06-30", periodo))
  table <- table %>% mutate(periodo = gsub("M07", "-07-31", periodo))
  table <- table %>% mutate(periodo = gsub("M08", "-08-31", periodo))
  table <- table %>% mutate(periodo = gsub("M09", "-09-30", periodo))
  table <- table %>% mutate(periodo = gsub("M10", "-10-31", periodo))
  table <- table %>% mutate(periodo = gsub("M11", "-11-30", periodo))
  table <- table %>% mutate(periodo = gsub("M12", "-12-31", periodo))
  table <- table %>% mutate(periodo=as.Date(periodo))

}


#---- grupos, subgrupos, clases, subclases, rúbricas y grupos especiales ----

#tabla de inflación por grupos para ccaa

# ipc_ccaa <- read_ipc("22350")
ipc_ccaa <- read_ipc("50913")
grupos <- unique(ipc_ccaa$`Grupos ECOICOP`)
datos <- unique(ipc_ccaa$`Tipo de dato`)

# tabla de grupos clases y subclases España [IPC ES]

ipc_grupos <- read_ipc("50902")
# ipc_subgrupos <- read_ipc("22345")
ipc_subgrupos <- read_ipc("50903")
subgrupos <- unique(ipc_subgrupos$Subgrupos)
# ipc_clases <- read_ipc("22346") #50904
ipc_clases <- read_ipc("50904")
clases <- unique(ipc_clases$Clases)
# ipc_subclases <- read_ipc("22347")
ipc_subclases <- read_ipc("50905")
subclases <- unique(ipc_subclases$Subclases)
# ipc_rubricas <- read_ipc("22348")
ipc_rubricas <- read_ipc("50906")
rubricas <- unique(ipc_rubricas$Rúbricas)
# ipc_grupos_especiales <- read_ipc("22349")
ipc_grupos_especiales <- read_ipc("50907")
grupos_especiales <- unique(ipc_grupos_especiales$`Grupos especiales`)

# tabla de ponderaciones [ponderaciones IPC]

ponderaciones <- read_ipc("23720") #ponderaciones por grupos #50946
ponderaciones_2022 <<- read_ipc("50946")
ponderaciones_ccaa <- read_ipc("23726") #ponderaciones por grupos y ccaa #50952
ponderaciones_ccaa_2022 <- read_ipc("50952")

ponderaciones <- bind_rows(ponderaciones, ponderaciones_2022)
ponderaciones_ccaa <- bind_rows(ponderaciones_ccaa, ponderaciones_ccaa_2022)


# tablas históricas España [IPC ES hist]

ipc_hist <- read_ipc("24075") # variaciones inflacion indice general desde 1961
ipc_hist_grupos <- read_ipc("24076") # variaciones inflación grupos desde 1993

# valores

ipc_valores <- data.frame(dato = unique(ipc_ccaa$`Tipo de dato`), dato_label=c("indice", "mensual", "anual", "acumulada"))

save(ipc_valores, file="data/ipc_valores.RData")

# clasificaciones (grupos, subgrupos, clases, subclases, grupos especiales y rubricas)


grupos <- tibble(label=unique(ipc_ccaa$`Grupos ECOICOP`)) %>%
  mutate(label=recode(label, `Índice general` = "00 Índice general")) %>%
  mutate(nivel = "grupos", codigo = substr(label, 1, 2), nombre=substr(label, 4, nchar(label))) %>%
  mutate(codigo =paste0("G", codigo))

subgrupos <- tibble(label=unique(ipc_subgrupos$Subgrupos)) %>%
  slice(-1) %>%
  mutate(nivel = "subgrupos", codigo = substr(label, 1, 3), nombre=substr(label, 5, nchar(label))) %>%
  mutate(codigo =paste0("G", codigo))

clases <- tibble(label=unique(ipc_clases$Clases)) %>%
  slice(-1) %>%
  mutate(nivel = "clases", codigo = substr(label, 1, 4), nombre=substr(label, 6, nchar(label))) %>%
  mutate(codigo =paste0("G", codigo))

subclases <- tibble(label=unique(ipc_subclases$Subclases)) %>%
  slice(-1) %>%
  mutate(nivel = "subclases", codigo = substr(label, 1, 5), nombre=substr(label, 7, nchar(label))) %>%
  mutate(codigo =paste0("G", codigo))

grupos_especiales <- tibble(label=unique(ipc_grupos_especiales$`Grupos especiales`))

grupos_especiales <- grupos_especiales %>%
  mutate(nivel="grupos_especiales", codigo = paste0("GE", substr(as.character(100:(99+nrow(grupos_especiales))), 2, 3)), nombre=label) %>%
  slice(-1)

rubricas <- tibble(label=unique(ipc_rubricas$Rúbricas))

rubricas <- rubricas %>%
  mutate(nivel="rubricas", codigo = paste0("R", substr(as.character(100:(99+nrow(rubricas))), 2, 3)), nombre=label) %>%
  slice(-1)

ipc_clas_grupos <- bind_rows(grupos, subgrupos, clases, subclases, grupos_especiales, rubricas)

ipc_clas_grupos <- ipc_clas_grupos %>% mutate(label = recode(label, `00 Índice general` = "Índice general"), codigo = recode(codigo, G00 = "general"))

save(ipc_clas_grupos, file = "data/ipc_clas_grupos.RData")

# ipc por ccaa

load("ipc_valores.RData")
load("ipc_clas_grupos.RData")
load("data/ccaa_iso.RData")

# ipc_ccaa <- read_ipc("22350")

names(ipc_ccaa) <- c("region", "grupos", "dato", "periodo", "valor")

#códigos ccaa
ipc_ccaa <- left_join(ipc_ccaa, ccaa_iso, by = c("region" = "label"))
ipc_ccaa <- ipc_ccaa %>% mutate(iso = replace_na(iso, "ES"))

ipc_ccaa <- left_join(ipc_ccaa, ipc_valores)
ipc_ccaa <- left_join(ipc_ccaa, ipc_clas_grupos, by = c("grupos" = "label"))
ipc_ccaa <- ipc_dates(ipc_ccaa)

ipc_ccaa <- ipc_ccaa %>%
  select(periodo, iso, codigo, dato_label, valor) %>%
  rename(region = iso, grupo = codigo, dato = dato_label)

ipc_ccaa <- ipc_ccaa %>% filter(!is.na(valor))

save(ipc_ccaa, file = "data/ipc_ccaa.RData")



# ipc ES por toda la clasificación

# load("ipc_valores.RData")
# load("ipc_clas_grupos.RData")

# ipc_grupos <- read_ipc("22344")
# ipc_subgrupos <- read_ipc("22345")
# ipc_clases <- read_ipc("22346")
# ipc_subclases <- read_ipc("22347")
# ipc_rubricas <- read_ipc("22348")
# ipc_grupos_especiales <- read_ipc("22349")

names(ipc_grupos) <- c("label", "dato", "periodo", "valor")
names(ipc_subgrupos) <- c("label", "dato", "periodo", "valor")
names(ipc_clases) <- c("label", "dato", "periodo", "valor")
names(ipc_subclases) <- c("label", "dato", "periodo", "valor")
names(ipc_rubricas) <- c("label", "dato", "periodo", "valor")
names(ipc_grupos_especiales) <- c("label", "dato", "periodo", "valor")

ipc_subgrupos <- ipc_subgrupos %>% filter(label != "Índice general")
ipc_clases <- ipc_clases %>% filter(label != "Índice general")
ipc_subclases <- ipc_subclases %>% filter(label != "Índice general")
ipc_rubricas <- ipc_rubricas %>% filter(label != "Índice general")
ipc_grupos_especiales <- ipc_grupos_especiales %>% filter(label != "Índice general")

ipc_clasif <- bind_rows(ipc_grupos, ipc_subgrupos, ipc_clases, ipc_subclases, ipc_rubricas, ipc_grupos_especiales)

ipc_clasif %>%
  group_by(label, dato, periodo) %>%
  summarise(n = sum(is.na(valor)), .groups = "drop")


ipc_clasif <- left_join(ipc_clasif, ipc_valores)
ipc_clasif <- left_join(ipc_clasif, ipc_clas_grupos)
ipc_clasif <- ipc_dates(ipc_clasif)

ipc_clasif <- ipc_clasif %>%
  select(periodo, nivel, codigo, dato_label, valor) %>%
  rename(grupo = codigo, dato = dato_label)

ipc_clasif <- ipc_clasif %>% filter(!is.na(valor))


save(ipc_clasif, file = "data/ipc_clasif.RData")

#---- IPC historico por grupos ----

library(tidyverse)


# ipc_hist_grupos <- read_ipc("24076")

names(ipc_hist_grupos)  <- c("grupos", "dato", "periodo", "valor")

ipc_hist_grupos <- left_join(ipc_hist_grupos, ipc_valores)
ipc_hist_grupos <- left_join(ipc_hist_grupos, ipc_clas_grupos, by = c("grupos" = "label"))
ipc_hist_grupos <- ipc_dates(ipc_hist_grupos)

ipc_hist_grupos <- ipc_hist_grupos %>%
  select(periodo, codigo, dato_label, valor) %>%
  rename(grupo = codigo, dato = dato_label)

ipc_hist_grupos <- ipc_hist_grupos %>% filter(!is.na(valor))

save(ipc_hist_grupos, file = "data/ipc_hist_grupos.RData")

# ipc_hist <- read_ipc("24075")

names(ipc_hist) <- c("dato", "grupos", "periodo", "valor")

ipc_hist <- left_join(ipc_hist, ipc_valores)
ipc_hist <- ipc_dates(ipc_hist)

ipc_hist <- ipc_hist %>%
  select(periodo, dato_label, valor) %>%
  rename(dato = dato_label)

ipc_hist <- ipc_hist %>% filter(!is.na(valor))

save(ipc_hist, file = "data/ipc_hist.RData")

#---- ponderaciones IPC ----

# ipc_pond <- read_ipc("23726")

ipc_pond <- ponderaciones_ccaa

names(ipc_pond) <- c("region", "grupo", "periodo", "valor")

ipc_pond <- left_join(ipc_pond, ccaa_iso, by=c("region" = "label"))
ipc_pond <- ipc_pond %>% mutate(iso = replace_na(iso, "ES"))

ipc_pond <- left_join(ipc_pond, ipc_clas_grupos, by = c("grupo" = "label"))

ipc_pond <- ipc_pond %>% filter(codigo!="general")

ipc_pond <- ipc_pond %>% select(periodo, iso, codigo, valor) %>%
  rename(region = iso, grupo = codigo)

save(ipc_pond, file="data/ipc_pond.RData")

