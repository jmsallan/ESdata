library(ESdata)
library(tidyverse)
library(lubridate)


pib_pm_oferta |>
  filter(nivel == 1,
         tipo == "indice",
         dato == "var_anual",
         ajuste == "ajustado") |>
  mutate(month = month(periodo), year = year(periodo)) |>
  filter(month == 6) |>
  ggplot(aes(periodo, valor, color = agregado)) +
  geom_line()
