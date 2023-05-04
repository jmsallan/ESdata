#25171
#25173
#25174

library(tidyverse)
load("ccaa_iso.RData")


read_ipv <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")
  
  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)
  
}


ipv <- read_ipv("25171")

ipv <- ipv %>%
  mutate(`Comunidades y Ciudades Autónomas` = replace_na(`Total Nacional`)) %>%
  select(-`Total Nacional`)

names(ipv) <- c("region", "tipo", "dato", "periodo", "valor") 

ipv <- left_join(ipv, ccaa_iso, by = c("region" = "label"))
ipv <- ipv %>% mutate(iso=replace_na(iso, "ES"))

ipv_tipo <- data.frame(tipo=unique(ipv$tipo), label_tipo=c("general", "nueva", "segunda_mano"))

ipv <- left_join(ipv, ipv_tipo)

ipv_dato <- data.frame(dato=unique(ipv$dato), label_dato=c("indice", "mensual", "anual", "acumulada"))

ipv <- left_join(ipv, ipv_dato)

ipv <- ipv %>% mutate(periodo = gsub("T1", "-01-31", periodo))
ipv <- ipv %>% mutate(periodo = gsub("T2", "-06-30", periodo))
ipv <- ipv %>% mutate(periodo = gsub("T3", "-09-30", periodo))
ipv <- ipv %>% mutate(periodo = gsub("T4", "-12-31", periodo))
ipv <- ipv %>% mutate(periodo=as.Date(periodo))

ipv <- ipv %>% select(periodo, iso, label_tipo, label_dato, valor) %>% 
  rename(region = iso, tipo = label_tipo, dato = label_dato)

ipv <- ipv %>% filter(!is.na(valor))

save(ipv, file="~/Dropbox (UPC)/quanti_docs/02-RLab/00-packages/ESdata/data/ipv.RData")

ipv_pond <- read_ipv("25174")
names(ipv_pond) <- c("region", "tipo", "periodo", "valor") 

ipv_pond <- left_join(ipv_pond, ccaa_iso, by = c("region" = "label"))
ipv_pond <- ipv_pond %>% mutate(iso=replace_na(iso, "ES"))

ipv_pond <- left_join(ipv_pond, ipv_tipo)

ipv_pond <- ipv_pond %>% select(periodo, iso, label_tipo, valor) %>% 
  rename(region = iso, tipo = label_tipo)

ipv_pond <- ipv_pond %>% filter(tipo!="general")
ipv_pond <- ipv_pond %>% filter(!is.na(valor))

save(ipv_pond, file="~/Dropbox (UPC)/quanti_docs/02-RLab/00-packages/ESdata/data/ipv_pond.RData")
