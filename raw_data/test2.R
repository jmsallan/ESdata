library(ESdata)
library(tidyverse)

pib_pm_rentas |>
  glimpse()

pib_pm_rentas |>
  filter(nivel == 2)

t <- pib_pm_rentas %>%
  filter(agregado %in% c("pib", "rem", "ben", "imp_sub") & dato == "base" & ajuste == "ajustado") %>%
  pivot_wider(names_from = "agregado", values_from = "valor")
  select(periodo, agregado, valor)

pib_pm_rentas |>
  filter(dato == "base" & ajuste == "ajustado") |>
  group_by(periodo, agregado) |>
  summarise(n = n(), .groups = "drop") |>
  filter(n != 1) |>
  pivot_wider(names_from = "agregado", values_from = "n") |>
  glimpse()

pib_pm_rentas |>
  filter(periodo == as.Date("1996-01-31"), dato == "base", ajuste == "ajustado")


t |>
  filter(valor == 4456)


pib_pm_rentas %>%
  filter(agregado %in% c("pib", "rem", "ben", "imp_sub") & dato == "base" & ajuste == "ajustado") %>%
  pivot_wider(names_from = "agregado", values_from = "valor") %>%
  mutate(pr_rem = rem/pib, pr_ben = ben/pib, pr_imp = imp_sub/pib) %>%
  select(periodo, pr_rem, pr_ben, pr_imp) %>%
  pivot_longer(cols = -periodo, names_to = "dato", values_to = "valor")
