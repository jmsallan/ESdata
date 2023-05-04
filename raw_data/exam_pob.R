library(tidyverse)
load("data/provincias_iso.RData")

#----- por provincia ----

read_pob <- function(code){
  dir <- "https://www.ine.es/jaxi/files/_px/es/csv_bdsc/t20/e245/p08/l0/03002.csv_bdsc?nocab=1"

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}

pob <- read_pob()

names(pob) <- c("region", "edad", "origen", "sexo", "periodo", "valor")

pob <- pob %>%
  mutate(region = gsub("  ", " ", region))

pob <- left_join(pob, provincias_iso %>% select(label, iso), by = c("region" = "label") )

pob <- pob %>%
  mutate(iso = replace_na(iso, "ES"))

pob <- pob %>%
  mutate(sexo = recode(sexo, `Ambos sexos` = "total", Hombres = "hombres", Mujeres = "mujeres"))

load("data/defunciones_sexo_edad.RData")

edad_def <- c(unique(defunciones_sexo_edad$edad)[1:19], "90-94", "95-99", "100+")
edad_pob <- tibble(edad=unique(pob$edad), edad_label = edad_def)

pob <- left_join(pob, edad_pob, by = "edad")
unique(pob$edad_label)

pob %>% glimpse()

pob <- pob %>%
  filter(origen == "TOTAL")

pob_prov_edad <- pob %>%
  select(periodo, iso, edad_label, sexo, valor) %>%
  rename(region = iso, edad = edad_label)

save(pob_prov_edad, file = "data/pob_prov_edad.RData")

#----- por comunidad autónoma [no valido por tener grupos de edad heterogéneos, hay que recurrir a agregar provincias para tener dato de CCAA] ----

read_epa <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}

pob_ccaa <- read_epa("4925")

names(pob_ccaa) <- c("sexo", "ccaa", "edad", "periodo", "valor")

unique(pob_ccaa$ccaa)

pob_ccaa <- left_join(pob_ccaa, ccaa_iso %>% select(label, iso),
                      by = c("ccaa" = "label"))

pob_ccaa <- pob_ccaa %>%
  mutate(sexo = recode(sexo, `Ambos sexos` = "total", Hombres = "hombres", Mujeres = "mujeres"))

unique(pob_ccaa$sexo)
unique(pob_ccaa$edad)
unique(pob_ccaa$ccaa)


pob_ccaa <- left_join(pob_ccaa, edad_pob, by = "edad")

