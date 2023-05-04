library(tidyverse)

read_ine <- function(code){
  dir <- paste0("https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/", code, ".csv?nocab=1")
  
  file <- read_csv2(dir, col_types = cols(Total=col_character()))
  
  file <- file %>% mutate(Total=gsub("\\.", "", Total))
  file <- file %>% mutate(Total=gsub(",", ".", Total))
  file <- file %>% mutate(Total=as.numeric(Total))
  
  return(file)
  
}

# def_ccaa <- read_ine("35177")
def_prov <- read_ine("35176")
# def_islas <- read_ine("35178")

# def_ccaa_sexo_edad <- read_ine("35179")
def_prov_sexo_edad <- read_ine("36166")

nombres_a <- c("label", "dato", "periodo", "valor")

# names(def_ccaa) <- nombres_a
names(def_prov) <- nombres_a
# names(def_islas) <- nombres_a

nombres_b <- c("label", "sexo", "edad", "dato", "periodo", "valor")

# names(def_ccaa_sexo_edad) <- nombres_b
names(def_prov_sexo_edad) <- nombres_b

save(def_prov, file = "raw_defunciones.RData")
save(def_prov_sexo_edad, file = "raw_defunciones_se.RData")

#----- tablas de provincias e islas -----

label <- unique(def_prov$label)

# islas <- unique(def_islas$label)

iso <- c("ES", "ES-AB", "ES-A", "ES-AL", "ES-VI", "ES-O", "ES-AV", "ES-BA", "ES-PM", "ES-B", "ES-BI", "ES-BU", "ES-CC", "ES-CA", "ES-S", "ES-CS", "ES-CR", "ES-CO", "ES-C", "ES-CU", "ES-SS", "ES-GI", "ES-GR", "ES-GU", "ES-H", "ES-HU", "ES-J", "ES-LE", "ES-L", "ES-LU", "ES-M", "ES-MA", "ES-MU", "ES-NA", "ES-OR", "ES-P", "ES-GC", "ES-PO", "ES-LO", "ES-SA", "ES-TF", "ES-SG", "ES-SE", "ES-SO", "ES-T", "ES-TE", "ES-TO", "ES-V", "ES-VA", "ES-ZA", "ES-Z", "ES-CE", "ES_ML")

nombres <- substr(label, 4, nchar(label))
nombres[1] <- "España"
nombres[3] <- "Alicante"
nombres[5] <- "Álava"
nombres[9] <- "Illes Balears"
nombres[16] <- "Castellón"
nombres[19] <- "A Coruña"
nombres[37] <- "Las Palmas"
nombres[39] <- "La Rioja"
nombres[48] <- "Valencia"

provincias_iso <- data.frame(label=label, iso=iso, nombres=nombres)

save(provincias_iso, file="provincias_iso.RData")

# load("ccaa_iso.RData")

# def_ccaa <- left_join(def_ccaa, ccaa_iso)
# def_ccaa_sexo_edad <- left_join(def_ccaa_sexo_edad, ccaa_iso)

def_prov <- left_join(def_prov, provincias_iso)
def_prov_sexo_edad <- left_join(def_prov_sexo_edad, provincias_iso)

#----- solo dato base ----

# def_ccaa <- def_ccaa %>% filter(dato == "Dato base")
# def_ccaa_sexo_edad <- def_ccaa_sexo_edad %>% filter(dato == "Dato base")

def_prov <- def_prov %>% filter(dato == "Dato base")
def_prov_sexo_edad <- def_prov_sexo_edad %>% filter(dato == "Dato base")

#---- obtener año y semana ----

# def_ccaa <- def_ccaa %>% mutate(year = as.numeric(substr(periodo, 1, 4)), semana = as.numeric(substr(periodo, 7, 8)))
# def_ccaa_sexo_edad <- def_ccaa_sexo_edad %>% mutate(year = as.numeric(substr(periodo, 1, 4)), semana = as.numeric(substr(periodo, 7, 8)))

def_prov <- def_prov %>% mutate(year = as.numeric(substr(periodo, 1, 4)), semana = as.numeric(substr(periodo, 7, 8)))
def_prov_sexo_edad <- def_prov_sexo_edad %>% mutate(year = as.numeric(substr(periodo, 1, 4)), semana = as.numeric(substr(periodo, 7, 8)))

#----- seleccionar columnas -----

# def_ccaa <- def_ccaa %>% select(year, semana, iso, valor) %>% rename(region = iso)
def_prov <- def_prov %>% select(year, semana, iso, valor) %>% rename(region = iso)

defunciones <- def_prov

save(defunciones, file="defunciones.RData")

#----- edad -----

paste0(seq(0,85,5), "-", seq(4,89,5)) 

def_edad <- data.frame(edad = unique(def_prov_sexo_edad$edad),
                       label_edad =c("total", paste0(seq(0,85,5), "-", seq(4,89,5)), "90+", "n.c."))

# def_ccaa_sexo_edad <- left_join(def_ccaa_sexo_edad, def_edad)
def_prov_sexo_edad <- left_join(def_prov_sexo_edad, def_edad)

# def_ccaa_sexo_edad <- def_ccaa_sexo_edad %>% mutate(sexo = recode(sexo, "Total" = "total", Hombres = "hombres", Mujeres = "mujeres"))

def_prov_sexo_edad <- def_prov_sexo_edad %>% mutate(sexo = recode(sexo, "Total" = "total", Hombres = "hombres", Mujeres = "mujeres"))

def_prov_sexo_edad <- def_prov_sexo_edad %>% filter(iso!="ES")

# def_ccaa_sexo_edad <- def_ccaa_sexo_edad %>% select(year, semana, iso, sexo, label_edad, valor) %>% rename(region = iso, edad = label_edad)

def_prov_sexo_edad <- def_prov_sexo_edad %>% select(year, semana, iso, sexo, label_edad, valor) %>% rename(region = iso, edad = label_edad) 

defunciones_sexo_edad <- def_prov_sexo_edad

save(defunciones_sexo_edad, file="defunciones_sexo_edad.RData")
