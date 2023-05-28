library(ESdata)
library(tidyverse)



pib_pm_demanda |>
  group_by(agregado, ajuste, tipo, dato) |>
  summarise(n = n()) |>
  filter(n > 113)

pib_pm_demanda |>
  filter(ajuste == "ajustado", tipo == "indice", dato == "base") |>
  group_by(agregado) |>
  summarise(n = n()) |>
  print(n = 200)



pib_pm_oferta |>
  group_by(agregado, ajuste, tipo, dato) |>
  summarise(n = n()) |>
  filter(n > 113)

pib_pm_oferta |>
  filter(ajuste == "ajustado", tipo == "indice", dato == "base") |>
  group_by(agregado) |>
  summarise(n = n()) |>
  print(n = 200)



pib_pm_rentas |>
  group_by(agregado, ajuste, dato) |>
  summarise(n = n()) |>
  filter(n > 113)

pib_pm_rentas |>
  filter(ajuste == "ajustado", dato == "base") |>
  group_by(agregado) |>
  summarise(n = n()) |>
  print(n = 200)
