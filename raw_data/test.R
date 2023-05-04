library(ESdata)
library(tidyverse)

epa_edad %>%
  filter(region=="ES" & edad=="total" & sexo=="total") %>%
  select(periodo, dato, valor) %>%
  pivot_wider(names_from = "dato", values_from = "valor") %>%
  mutate(t_act=act/(act+ina), t_paro=par/act)

t <- epa_edad %>%
  filter(region=="ES" & edad=="total" & sexo=="total") %>%
  select(periodo, dato, valor)

unique(t$dato)
