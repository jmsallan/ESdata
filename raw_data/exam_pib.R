library(tidyverse)
library(ESdata)

read_pib <- function(code){
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

  table <- table %>% mutate(periodo = gsub("T1", "-01-31", periodo))
  table <- table %>% mutate(periodo = gsub("T2", "-06-30", periodo))
  table <- table %>% mutate(periodo = gsub("T3", "-09-30", periodo))
  table <- table %>% mutate(periodo = gsub("T4", "-12-31", periodo))


  table <- table %>% mutate(periodo=as.Date(periodo))
}

#----- leyendo tablas de PIB -----

pib_pm_oferta <- read_pib("30678")
pib_pm_demanda <- read_pib("30680")
pib_pm_rentas <- read_pib("30682")

pib_pm_oferta_indice <- read_pib("30679")
pib_pm_demanda_indice <- read_pib("30681")

#---- elementos oferta agregada ----

oferta_1 <- unique(c(pib_pm_oferta$`Agregados macroeconómicos: Nivel 1`))
oferta_2 <- unique(c(pib_pm_oferta$`Agregados macroeconómicos: Nivel 2`))

oferta_1 <- oferta_1[which(!is.na(oferta_1))]
oferta_2 <- oferta_2[which(!is.na(oferta_2))]

agr_label_1 <- c("pib", "vab_A", "vab_BE", "vab_F", "vab_GT", "imp_sub")
agr_label_2 <- c("vab_C", "vab_GI", "vab_J", "vab_K", "vab_L", "vab_MN", "vab_OQ", "vab_RT",  "imp", "sub")

o1 <- data.frame(agr_label = agr_label_1, agregado = oferta_1, nivel = 1)
o2 <- data.frame(agr_label = agr_label_2, agregado = oferta_2, nivel = 2)

pib_oferta_agregados <- bind_rows(o1, o2)

save(pib_oferta_agregados, file = "data/pib_oferta_agregados.RData")

#---- elementos demanda agregada ----

demanda_1 <- unique(pib_pm_demanda$`Agregados macroeconómicos: Nivel 1`)
demanda_2 <- unique(pib_pm_demanda$`Agregados macroeconómicos: Nivel 2`)
demanda_3 <- unique(pib_pm_demanda$`Agregados macroeconómicos: Nivel 3`)
demanda_4 <- unique(pib_pm_demanda$`Agregados macroeconómicos: Nivel 4`)
demanda_5 <- unique(pib_pm_demanda$`Agregados macroeconómicos: Nivel 5`)
demanda_6 <- unique(pib_pm_demanda$`Agregados macroeconómicos: Nivel 6`)

demanda_1 <- demanda_1[which(!is.na(demanda_1))]
demanda_2 <- demanda_2[which(!is.na(demanda_2))]
demanda_3 <- demanda_3[which(!is.na(demanda_3))]
demanda_4 <- demanda_4[which(!is.na(demanda_4))]
demanda_5 <- demanda_5[which(!is.na(demanda_5))]
demanda_6 <- demanda_6[which(!is.na(demanda_6))]

id_1 <- c("pib", "dn", "xm")
id_2 <- c("C", "C_h_isflsh", "C_h", "C_h_fi", "C_isflsh", "C_AAPP", "C_fie", "FBC", "X_bs", "M_bs")
id_3 <- c("C_fi_bd", "C_fi_obs", "C_fi_AAPP", "C_fc_AAPP",  "FBCF", "VE_OV", "VE", "OV", "X_b", "X_s", "M_b", "M_s")
id_4 <- c("FBCF_afm", "FBCF_afi", "X_rm", "M_rm")
id_5 <- c("FBCF_afm_con", "FBCF_afm_maq", "FBCF_afm_rbc")
id_6 <- c("FBCF_afm_con_viv", "FBCF_afm_con_edif", "FBCF_afm_maq_transp", "FBCF_afm_maq_arm")

d1 <- data.frame(agr_label = id_1, agregado = demanda_1, nivel = 1)
d2 <- data.frame(agr_label = id_2, agregado = demanda_2, nivel = 2)
d3 <- data.frame(agr_label = id_3, agregado = demanda_3, nivel = 3)
d4 <- data.frame(agr_label = id_4, agregado = demanda_4, nivel = 4)
d5 <- data.frame(agr_label = id_5, agregado = demanda_5, nivel = 5)
d6 <- data.frame(agr_label = id_6, agregado = demanda_6, nivel = 6)

pib_demanda_agregados <- bind_rows(d1, d2, d3, d4, d5, d6)

save(pib_demanda_agregados, file = "data/pib_demanda_agregados.RData")

#---- elementos rentas ----

rentas_1 <- unique(pib_pm_rentas$`Agregados macroeconómicos: Nivel 1`)
rentas_2 <- unique(pib_pm_rentas$`Agregados macroeconómicos: Nivel 2`)

rentas_1 <- rentas_1[which(!is.na(rentas_1))]
rentas_2 <- rentas_2[which(!is.na(rentas_2))]

idr_1 <- c("pib", "rem", "rem_A", "rem_BE", "rem_C", "rem_F", "rem_GT", "rem_GI", "rem_J", "rem_K", "rem_L", "rem_MN", "rem_OQ", "rem_RT", "ben", "imp_sub")

idr_2 <- c("sal", "css", "sal_A", "css_A", "sal_BE", "css_BE", "sal_C", "css_C", "sal_F", "css_F", "sal_GT", "css_GT", "sal_GI", "css_GI", "sal_J", "css_J", "sal_K", "css_K", "sal_L", "css_L", "sal_MN", "css_MN", "sal_OQ", "css_OQ", "sal_RT", "css_RT", "imp", "sub")

r1 <- data.frame(agr_label = idr_1, agregado = rentas_1, nivel = 1)
r2 <- data.frame(agr_label = idr_2, agregado = rentas_2, nivel = 2)

pib_rentas_agregados <- bind_rows(r1, r2)

save(pib_rentas_agregados, file = "data/pib_rentas_agregados.RData")




#---- PIB demanda ----.

pib_pm_demanda <- pib_pm_demanda %>% mutate(dato2 = "valor")
pib_pm_demanda_indice <- pib_pm_demanda_indice %>% mutate(dato2 = "indice")
pib_pm_demanda <- bind_rows(pib_pm_demanda, pib_pm_demanda_indice)


# valores de dato de PIB (Niveles y Tasas)

pib_dato <- data.frame(dato_label = c("base", "var_trim", "var_anual", "ap_trim", "ap_anual") , dato = unique(pib_pm_demanda$`Niveles y tasas`))

save(pib_dato, file = "data/pib_dato.RData")

# valores de tipo de PIB (Tipo de dato)

pib_tipo <- data.frame(tipo_label = c("no_ajustado", "ajustado"), tipo = unique(pib_pm_demanda$`Tipo de dato`))

save(pib_tipo, file = "data/pib_tipo.RData")

pib_pm_demanda <- left_join(pib_pm_demanda, pib_dato, by =c("Niveles y tasas" = "dato"))

pib_pm_demanda <- left_join(pib_pm_demanda, pib_tipo,
by = c("Tipo de dato" = "tipo"))

pib_d1 <- pib_pm_demanda %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         is.na(`Agregados macroeconómicos: Nivel 2`),
         is.na(`Agregados macroeconómicos: Nivel 3`),
         is.na(`Agregados macroeconómicos: Nivel 4`),
         is.na(`Agregados macroeconómicos: Nivel 5`),
         is.na(`Agregados macroeconómicos: Nivel 6`)) %>%
  left_join(pib_demanda_agregados, by = c("Agregados macroeconómicos: Nivel 1" = "agregado"))

pib_d2 <- pib_pm_demanda %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         !is.na(`Agregados macroeconómicos: Nivel 2`),
         is.na(`Agregados macroeconómicos: Nivel 3`),
         is.na(`Agregados macroeconómicos: Nivel 4`),
         is.na(`Agregados macroeconómicos: Nivel 5`),
         is.na(`Agregados macroeconómicos: Nivel 6`)) %>%
  left_join(pib_demanda_agregados, by = c("Agregados macroeconómicos: Nivel 2" = "agregado"))

pib_d3 <- pib_pm_demanda %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         !is.na(`Agregados macroeconómicos: Nivel 2`),
         !is.na(`Agregados macroeconómicos: Nivel 3`),
         is.na(`Agregados macroeconómicos: Nivel 4`),
         is.na(`Agregados macroeconómicos: Nivel 5`),
         is.na(`Agregados macroeconómicos: Nivel 6`)) %>%
  left_join(pib_demanda_agregados, by = c("Agregados macroeconómicos: Nivel 3" = "agregado"))

pib_d4 <- pib_pm_demanda %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         !is.na(`Agregados macroeconómicos: Nivel 2`),
         !is.na(`Agregados macroeconómicos: Nivel 3`),
         !is.na(`Agregados macroeconómicos: Nivel 4`),
         is.na(`Agregados macroeconómicos: Nivel 5`),
         is.na(`Agregados macroeconómicos: Nivel 6`)) %>%
  left_join(pib_demanda_agregados, by = c("Agregados macroeconómicos: Nivel 4" = "agregado"))

pib_d5 <- pib_pm_demanda %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         !is.na(`Agregados macroeconómicos: Nivel 2`),
         !is.na(`Agregados macroeconómicos: Nivel 3`),
         !is.na(`Agregados macroeconómicos: Nivel 4`),
         !is.na(`Agregados macroeconómicos: Nivel 5`),
         is.na(`Agregados macroeconómicos: Nivel 6`)) %>%
  left_join(pib_demanda_agregados, by = c("Agregados macroeconómicos: Nivel 5" = "agregado"))

pib_d6 <- pib_pm_demanda %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         !is.na(`Agregados macroeconómicos: Nivel 2`),
         !is.na(`Agregados macroeconómicos: Nivel 3`),
         !is.na(`Agregados macroeconómicos: Nivel 4`),
         !is.na(`Agregados macroeconómicos: Nivel 5`),
         !is.na(`Agregados macroeconómicos: Nivel 6`)) %>%
  left_join(pib_demanda_agregados, by = c("Agregados macroeconómicos: Nivel 6" = "agregado"))

pib_pm_demanda2 <- bind_rows(pib_d1, pib_d2, pib_d3, pib_d4, pib_d5, pib_d6)

pib_pm_demanda2 <- pib_pm_demanda2 %>%
  select(-c(`Agregados macroeconómicos: Nivel 1`:`Agregados macroeconómicos: Nivel 6`)) %>%
  rename(agregado = agr_label, ajuste = tipo_label, tipo = dato2, dato = dato_label, periodo = Periodo, valor = Total) %>%
  select(-c(`Tipo de dato`, `Niveles y tasas`)) %>%
  select(periodo, agregado, nivel, ajuste, tipo, dato, valor)

pib_pm_demanda2 <- ipc_dates(pib_pm_demanda2)

pib_pm_demanda2 <- pib_pm_demanda2 %>% filter(!is.na(valor))


pib_pm_demanda2 |>
  group_by(agregado, ajuste, tipo, dato) |>
  summarise(n = n()) |>
  filter(n > 113)

pib_pm_demanda2 |>
  filter(ajuste == "ajustado", tipo == "indice", dato == "base") |>
  group_by(agregado) |>
  summarise(n = n()) |>
  print(n = 200)

pib_pm_demanda <- pib_pm_demanda2

save(pib_pm_demanda, file = "data/pib_pm_demanda.RData")


#---- PIB oferta ----

pib_pm_oferta <- pib_pm_oferta %>% mutate(dato2 = "valor")
pib_pm_oferta_indice <- pib_pm_oferta_indice %>% mutate(dato2 = "indice")
pib_pm_oferta <- bind_rows(pib_pm_oferta, pib_pm_oferta_indice)

pib_pm_oferta <- left_join(pib_pm_oferta, pib_dato, by =c("Niveles y tasas" = "dato"))

pib_pm_oferta <- left_join(pib_pm_oferta, pib_tipo,
                            by = c("Tipo de dato" = "tipo"))

pib_o1 <- pib_pm_oferta %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         is.na(`Agregados macroeconómicos: Nivel 2`)) %>%
  left_join(pib_oferta_agregados, by = c("Agregados macroeconómicos: Nivel 1" = "agregado"))

pib_o2 <- pib_pm_oferta %>%
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         !is.na(`Agregados macroeconómicos: Nivel 2`)) %>%
  left_join(pib_oferta_agregados, by = c("Agregados macroeconómicos: Nivel 2" = "agregado"))

pib_pm_oferta2 <- bind_rows(pib_o1, pib_o2)

pib_pm_oferta2 <- pib_pm_oferta2 %>%
  select(-c(`Agregados macroeconómicos: Nivel 1`:`Agregados macroeconómicos: Nivel 2`)) %>%
  rename(agregado = agr_label, ajuste = tipo_label, tipo = dato2, dato = dato_label, periodo = Periodo, valor = Total) %>%
  select(-c(`Tipo de dato`, `Niveles y tasas`)) %>%
  select(periodo, agregado, nivel, ajuste, tipo, dato, valor)

pib_pm_oferta2 <- ipc_dates(pib_pm_oferta2)

pib_pm_oferta2 <- pib_pm_oferta2 %>% filter(!is.na(valor))

pib_pm_oferta2 |>
  group_by(agregado, ajuste, tipo, dato) |>
  summarise(n = n()) |>
  filter(n > 113)

pib_pm_oferta2 |>
  filter(ajuste == "ajustado", tipo == "indice", dato == "base") |>
  group_by(agregado) |>
  summarise(n = n()) |>
  print(n = 200)

pib_pm_oferta <- pib_pm_oferta2

save(pib_pm_oferta, file = "data/pib_pm_oferta.RData")

#---- PIB rentas -----

pib_pm_rentas <- left_join(pib_pm_rentas, pib_tipo,
                           by = c("Tipo de dato" = "tipo"))

pib_pm_rentas <- left_join(pib_pm_rentas, pib_dato,
                           by =c("Niveles y tasas" = "dato"))

r1 <- pib_pm_rentas |>
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         is.na(`Agregados macroeconómicos: Nivel 2`))  %>%
  left_join(pib_rentas_agregados, by = c("Agregados macroeconómicos: Nivel 1" = "agregado"))

r2 <- pib_pm_rentas |>
  filter(!is.na(`Agregados macroeconómicos: Nivel 1`),
         !is.na(`Agregados macroeconómicos: Nivel 2`))  %>%
  left_join(pib_rentas_agregados, by = c("Agregados macroeconómicos: Nivel 2" = "agregado"))

pib_pm_rentas2 <- bind_rows(r1, r2)

# pib_pm_rentas <- pib_pm_rentas |>
#   mutate(agregados = ifelse(is.na(`Agregados macroeconómicos: Nivel 2`), `Agregados macroeconómicos: Nivel 1`, `Agregados macroeconómicos: Nivel 2`)) |>
#   select(-c(`Agregados macroeconómicos: Nivel 1`, `Agregados macroeconómicos: Nivel 2`))
#
#
#
# pib_pm_rentas <- left_join(pib_pm_rentas, pib_rentas_agregados,
#                            by = c("agregados" = "agregado"))


# pib_r1 <- pib_pm_rentas %>%
#   filter(!is.na(`Agregados macroeconómicos: Nivel 1`)) %>%
#   left_join(pib_rentas_agregados, by = c("Agregados macroeconómicos: Nivel 1" = "agregado"))
#
# pib_r2 <- pib_pm_rentas %>%
#   filter(!is.na(`Agregados macroeconómicos: Nivel 2`)) %>%
#   left_join(pib_rentas_agregados, by = c("Agregados macroeconómicos: Nivel 2" = "agregado"))

# pib_pm_rentas2 <- bind_rows(pib_r1, pib_r2)

pib_pm_rentas2 <- pib_pm_rentas2 %>%
  rename(agregado = agr_label, ajuste = tipo_label, dato = dato_label, periodo = Periodo, valor = Total) %>%
  select(periodo, agregado, nivel, ajuste, dato, valor)

pib_pm_rentas2 <- pib_pm_rentas2 %>% filter(!is.na(valor))

pib_pm_rentas2 <- ipc_dates(pib_pm_rentas2)

pib_pm_rentas2 |>
  group_by(agregado, ajuste, dato) |>
  summarise(n = n()) |>
  filter(n > 113)

pib_pm_rentas2 |>
  filter(ajuste == "ajustado", dato == "base") |>
  group_by(agregado) |>
  summarise(n = n()) |>
  print(n = 200)


pib_pm_rentas <- pib_pm_rentas2

save(pib_pm_rentas, file = "data/pib_pm_rentas.RData")
