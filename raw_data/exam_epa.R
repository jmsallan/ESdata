library(tidyverse)

#reading the file
data_3977 <- read_csv2("3977.csv")
data_3977 <- read.csv2("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/3977.csv?nocab=1")

#transforming data into numeric
data_3977 <- data_3977 %>% mutate(Total=gsub("\\.", "", Total))
data_3977 <- data_3977 %>% mutate(Total=gsub(",", ".", Total))
data_3977 <- data_3977 %>% mutate(Total=as.numeric(Total))


f <- data_3977$Total
g <- gsub("\\.", "", f)
h <- gsub(",", ".", g)
i <- as.numeric(h)

#---- códigos ISO comunidades autónomas ----

library(tidyverse)

read_epa <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}

pob <- read_epa("4189") #incluye menores de 16 y mayores de 65

names(pob) <- c("sexo", "total_nacional", "ccaa", "edad", "periodo", "total")

pob <- pob |>
  mutate(ccaa = ifelse(is.na(ccaa), "Total Nacional", ccaa)) |>
  select(-total_nacional)

ccaa <- unique(pob$ccaa)

iso <- c("ES", "ES-AN", "ES-AR", "ES-AS", "ES-IB", "ES-CN", "ES-CB", "ES-CL", "ES-CM", "ES-CT", "ES-VC", "ES-EX", "ES-GA", "ES-MD", "ES-MC", "ES-NC", "ES-PV", "ES-RI", "ES-CE", "ES-ML")

nombres <- c("España", "Andalucía", "Aragón", "Principado de Asturias", "Illes Balears", "Canarias", "Cantabria", "Castilla y León", "Castilla - La Mancha", "Catalunya", "Comunidad Valenciana", "Extremadura", "Galicia", "Comunidad de Madrid", "Región de Murcia", "Comunidad Foral de Navarra", "País Vasco", "La Rioja", "Ceuta", "Melilla")

ccaa_iso <- data.frame(label=ccaa, iso=iso, nombres=nombres)

save(ccaa_iso, file="data/ccaa_iso.RData")

#---- EPA por edad, sexo y CCAA ----

library(tidyverse)

load("data/ccaa_iso.RData")

read_epa <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}


# 4189: Población por grupo de edad, sexo y comunidad autónoma. Valores absolutos

pob <- read_epa("4189") #incluye menores de 16 y mayores de 65

pob <- pob %>%
  mutate(dato = "pob") %>%
  mutate(`Comunidades y Ciudades Autónomas` = ifelse(is.na(`Comunidades y Ciudades Autónomas`), "Total Nacional", `Comunidades y Ciudades Autónomas`)) %>%
  select(-`Total Nacional`)

# 4204: Activos por grupo de edad, sexo y comunidad autónoma. Valores absolutos

act <- read_epa("4204")
act <- act %>% mutate(dato="act")

# 4211: Ocupados por grupo de edad, sexo y comunidad autónoma. Valores absolutos

ocu <- read_epa("4211")
ocu <- ocu %>% mutate(dato="ocu")


# 4245: Parados por grupo de edad, sexo y comunidad autónoma. Valores absolutos

par <- read_epa("4245")
par <- par %>% mutate(dato="par")

# 4255: Inactivos por grupo de edad, sexo y comunidad autónoma. Valores absolutos

ina <- read_epa("4255") # incluye 65 y más años
ina <- ina %>% mutate(dato="ina")

epa_edad <- bind_rows(pob, act, ocu, par, ina)
names(epa_edad) <- c("sexo", "ccaa", "edad", "periodo", "valor", "dato")

# modificando sexo y edad
epa_edad <- epa_edad %>% mutate(sexo = recode(sexo, `Ambos sexos` = "total", Hombres = "hombres", Mujeres = "mujeres"),
                                edad = recode(edad, Total="total", `Menores de 16` = "0-16", `De 16 a 19 años`="16-19", `De 20 a 24 años`="20-24", `De 25 a 34 años`="25-34", `De 35 a 44 años`="35-44", `De 45 a 54 años`="45-54", `De 55 a 64 años`="55-64", `65 y más años`="65+", `55 y más años`="65+"))

#obteniendo region
epa_edad <- left_join(epa_edad, ccaa_iso, by = c("ccaa" = "label"))
epa_edad <- epa_edad %>% rename(region = iso)

# modificando fechas
epa_edad <- epa_edad %>% mutate(periodo = gsub("T1", "-01-31", periodo))
epa_edad <- epa_edad %>% mutate(periodo = gsub("T2", "-06-30", periodo))
epa_edad <- epa_edad %>% mutate(periodo = gsub("T3", "-09-30", periodo))
epa_edad <- epa_edad %>% mutate(periodo = gsub("T4", "-12-31", periodo))
epa_edad <- epa_edad %>% mutate(periodo=as.Date(periodo))

epa_edad <- epa_edad %>% select(periodo, region, edad, sexo, dato, valor)


save(epa_edad, file="data/epa_edad.RData")


#---- EPA por nacionalidad, sexo y ccaa ----

library(tidyverse)

read_epa <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}
load("data/ccaa_iso.RData")

# Población por nacionalidad, sexo y comunidad autónoma: 4192

pob <- read_epa("4192")
pob <- pob %>% mutate(dato="pob")

# Activos por nacionalidad, sexo y comunidad autónoma: 4210

act <- read_epa("4210")
act <- act %>% mutate(dato="act")

# Ocupados por nacionalidad, sexo y comunidad autónoma: 4222

ocu <- read_epa("4222")
ocu <- ocu %>% mutate(dato="ocu")

epa_nac <- bind_rows(pob, act, ocu)

names(epa_nac) <- c("sexo", "ccaa", "nac", "periodo", "valor", "dato")

# modificando sexo y nacionalidad
epa_nac <- epa_nac %>% mutate(sexo = recode(sexo, `Ambos sexos` = "total", Hombres = "hombres", Mujeres = "mujeres"),
                                nac = recode(nac, Total="total", Española = "ES", `Extranjera: Total` = "EX", `Extranjera: Unión Europea` = "UE", `Extranjera: No pertenecientes a la Unión Europea` = "no-UE"))

#obteniendo region
epa_nac <- left_join(epa_nac, ccaa_iso, by = c("ccaa" = "label"))
epa_nac <- epa_nac %>% rename(region = iso)

# modificando fechas
epa_nac <- epa_nac %>% mutate(periodo = gsub("T1", "-01-31", periodo))
epa_nac <- epa_nac %>% mutate(periodo = gsub("T2", "-06-30", periodo))
epa_nac <- epa_nac %>% mutate(periodo = gsub("T3", "-09-30", periodo))
epa_nac <- epa_nac %>% mutate(periodo = gsub("T4", "-12-31", periodo))
epa_nac <- epa_nac %>% mutate(periodo=as.Date(periodo))

epa_nac <- epa_nac %>% select(periodo, region, nac, sexo, dato, valor)

save(epa_nac, file="data/epa_nac.RData")

#--- EPA por nivel de formación, sexo y ccaa ---

library(tidyverse)
read_epa <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}
load("data/ccaa_iso.RData")


# Población por formación, sexo y comunidad autónoma: 4192

pob <- read_epa("6370")
pob <- pob %>% mutate(dato="pob")

# Activos por formación, sexo y comunidad autónoma: 4210

act <- read_epa("6368")
act <- act %>% mutate(dato="act")

# Ocupados por formación, sexo y comunidad autónoma: 4222

ocu <- read_epa("6359")
ocu <- ocu %>% mutate(dato="ocu")

epa_form <- bind_rows(pob, act, ocu)

names(epa_form) <- c("sexo", "ccaa", "form", "periodo", "valor", "dato")

# modificando sexo, nacionalidad y formación
epa_form <- epa_form %>% mutate(sexo = recode(sexo, `Ambos sexos` = "total", Hombres = "hombres", Mujeres = "mujeres"),
                              form = recode(form, Total="total", Analfabetos = "analf", `Estudios primarios incompletos` = "prim_inic", `Educación primaria` = "prim", `Primera etapa de Educación Secundaria y similar` = "sec_1", `Segunda etapa de educación secundaria, con orientación general` = "sec_2_gen", `Segunda etapa de educación secundaria con orientación profesional (incluye educación postsecundaria no superior)` = "sec_2_prof", `Educación Superior` = "ed_sup"))

#obteniendo region
epa_form <- left_join(epa_form, ccaa_iso, by = c("ccaa" = "label"))
epa_form <- epa_form %>% rename(region = iso)


# modificando fechas
epa_form <- epa_form %>% mutate(periodo = gsub("T1", "-01-31", periodo))
epa_form <- epa_form %>% mutate(periodo = gsub("T2", "-06-30", periodo))
epa_form <- epa_form %>% mutate(periodo = gsub("T3", "-09-30", periodo))
epa_form <- epa_form %>% mutate(periodo = gsub("T4", "-12-31", periodo))
epa_form <- epa_form %>% mutate(periodo=as.Date(periodo))

epa_form <- epa_form %>% select(periodo, region, form, sexo, dato, valor)

save(epa_form, file="data/epa_form.RData")

#---- EPA ocupados por sector económico ----

library(tidyverse)
read_epa <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")

  file <- read_csv2(dir, col_types = cols(Total=col_character()))

  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))

  return(file)

}
load("ccaa_iso.RData")


ocu <- read_epa("3977")

epa_sector <- ocu

names(epa_sector) <- c("ccaa", "sexo", "sector", "edad", "periodo", "valor")

# modificando sexo, sector y edad
epa_sector <- epa_sector %>% mutate(sexo = recode(sexo, `Ambos sexos` = "total", Hombres = "hombres", Mujeres = "mujeres"),
                                sector = recode(sector, Total="total", Agricultura = "agricultura", Industria = "industria", Construcción = "construccion", Servicios = "servicios"),
                                edad = recode(edad, Total="total", `De 16 a 19 años`="16-19", `De 20 a 24 años`="20-24", `De 25 a 54 años`="25-54", `55 y más años`="65+"))

#obteniendo region
epa_sector <- left_join(epa_sector, ccaa_iso, by = c("ccaa" = "label"))
epa_sector <- epa_sector %>% rename(region = iso)

# modificando fechas
epa_sector <- epa_sector %>% mutate(periodo = gsub("T1", "-01-31", periodo))
epa_sector <- epa_sector %>% mutate(periodo = gsub("T2", "-06-30", periodo))
epa_sector <- epa_sector %>% mutate(periodo = gsub("T3", "-09-30", periodo))
epa_sector <- epa_sector %>% mutate(periodo = gsub("T4", "-12-31", periodo))
epa_sector <- epa_sector %>% mutate(periodo=as.Date(periodo))

epa_sector <- epa_sector %>% select(periodo, region, sector, edad, sexo, valor)

save(epa_sector, file="data/epa_sector.RData")

