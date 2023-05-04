library(tidyverse)
library(ESdata)

prov_ccaa <- provincias_iso %>% 
  select(label, iso) %>%
  arrange(label)

key <- c("ES-PV", "ES-CM", "ES-VC", "ES-AN", "ES-CL", "ES-EX", "ES-IB", "ES-CT", "ES-CL", "ES-EX",
         "ES-AN", "ES-VC", "ES-CM", "ES-AN", "ES-GA", "ES-CM", "ES-CT", "ES-AN", "ES-CM", "ES-PV",
         "ES-AN", "ES-AR", "ES-AN", "ES-CL", "ES-CT", "ES-RI", "ES-GA", "ES-MD", "ES-AN", "ES-MC",
         "ES-NC", "ES-GA", "ES-AS", "ES-CL", "ES-CN", "ES-GA", "ES-CL", "ES-CN", "ES-CB", "ES-CL",
         "ES-AN", "ES-CL", "ES-CT", "ES-AR", "ES-CM", "ES-VC",
         "ES-CL", "ES-PV", "ES-CL", "ES-AR", "ES-CE", "ES-ML", "ES")

prov_ccaa <- prov_ccaa %>%
  mutate(iso_ccaa = key)

prov_ccaa <- prov_ccaa %>%
  select(iso, iso_ccaa) %>%
  rename(iso_prov = iso)

save(prov_ccaa, file = "prov_ccaa.RData")

test <- prov_ccaa

test <- full_join(test, provincias_iso %>% select(iso, nombres), by = c("iso_prov" = "iso"))

test <- full_join(test, ccaa_iso %>% select(iso, nombres), by = c("iso_ccaa" = "iso"))
