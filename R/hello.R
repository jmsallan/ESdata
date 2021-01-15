#' ISO code of Spanish regions
#'
#' @description The ISO 3166-2 codes for Spanish autonomous communities
#'
#' \describe{
#' \item{label}{The autonomous community name, as it appears in INE datasets.}
#' \item{iso}{The ISO code of the autonomous community (e.g., ES-CT for Catalonia).}
#' \item{nombres}{The official name of the autonomous community.}
#' }
#'
#' @examples
#'
#' ccaa_iso
#'
#' @source \url{https://es.wikipedia.org/wiki/ISO_3166-2:ES}
#'
'ccaa_iso'

#' Encuesta de Población Activa (Labor Force Survey) by region, age and gender
#'
#' @description The Spanish Labor Force Survey by region, age and gender in tidy format.
#'
#' \describe{
#' \item{periodo}{The last day of the quarter of each row, in date format.}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{edad}{The age segment for each row.}
#' \item{sexo}{The gender for each row: `total' for the sum of both genders, 'hombres' for men and 'mujeres' for women.}
#' \item{dato}{The type of data for each row: 'pob' is active population, 'act' is total workforce, 'ocu' is employed population, 'par' is unemployed population, 'ina' is non-active population.}
#' \item{valor}{The value of the data for the row. All data are thousands of people.}
#' }
#'
#' @examples
#'
#' epa_edad
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=982&capsel=983}
#'
'epa_edad'

#' Encuesta de Población Activa (Labor Force Survey) by region, training and gender
#'
#' @description The Spanish Labor Force Survey by region, training and gender in tidy format.
#'
#' \describe{
#' \item{periodo}{The last day of the quarter of each row, in date format.}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{form}{The traning level for each row: 'total' (all sample), 'analf' (illiterate), 'prim_inic' (started primary education), 'prim' (primary education completed), 'sec_1' (first level of secondary education completed), 'sec_2_gen' (second level of secondary education completed, general), 'sec_2_prof' (second level of secondary education completed, vocational), 'ed_sup' (higher education).}
#' \item{sexo}{The gender for each row: `total' for the sum of both genders, 'hombres' for men and 'mujeres' for women.}
#' \item{dato}{The type of data for each row: 'pob' is active population, 'act' is total workforce, 'ocu' is employed population, 'par' is unemployed population, 'ina' is non-active population.}
#' \item{valor}{The value of the data for the row. All data are thousands of people.}
#' }
#'
#' @examples
#'
#' epa_form
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=982&capsel=983}
#'
'epa_form'

#' Encuesta de Población Activa (Labor Force Survey) by region, nationality and gender
#'
#' @description The Spanish Labor Force Survey by nationality (Spanish, EU, non-EU), training and gender in tidy format.
#'
#' \describe{
#' \item{periodo}{The last day of the quarter of each row, in date format.}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{nac}{Nationality for each row: 'total' (all sample),, 'ES' (Spanish), 'EX' (non-Spanish), 'UE' (countries of member of the European Union), 'no-UE' (countries outside the European Union).}
#' \item{sexo}{The gender for each row: `total' for the sum of both genders, 'hombres' for men and 'mujeres' for women.}
#' \item{dato}{The type of data for each row: 'pob' is active population, 'act' is total workforce, 'ocu' is employed population, 'par' is unemployed population, 'ina' is non-active population.}
#' \item{valor}{The value of the data for the row. All data are thousands of people.}
#' }
#'
#' @examples
#'
#' epa_nac
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=982&capsel=983}
#'
'epa_nac'

#' Active population by region, industry and gender
#'
#' @description The Spanish Labor Force Survey by nationality (Spanish, EU, non-EU), training and gender in tidy format.
#'
#' \describe{
#' \item{periodo}{The last day of the quarter of each row, in date format.}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{sector}{Nationality for each row: 'total' (all sample),, 'ES' (Spanish), 'EX' (non-Spanish), 'UE' (countries of member of the European Union), 'no-UE' (countries outside the European Union).}
#' \item{sexo}{The gender for each row: `total' for the sum of both genders, 'hombres' for men and 'mujeres' for women.}
#' \item{valor}{The value of the data for the row. All data are thousands of people.}
#' }
#'
#' @examples
#'
#' epa_sector
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=982&capsel=983}
#'
'epa_sector'

#' Historical series of variation of Spanish Consumer Price Index (since 1961)
#'
#' @description Monthly inflation data of Spain since 1961
#'
#' \describe{
#' \item{periodo}{The last day of the month of each row, in date format.}
#' \item{dato}{The type of datum for each row: 'mensual' is the monthly inflation rate, 'anual' the inter-annual inflation rate and 'acumulada' the cumulative inflation rate for the year.}
#' \item{valor}{the inflation rate, in percentage.}
#' }
#'
#' @examples
#'
#' ipc_hist
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipc_hist'

#' Historical series of variation of Spanish Consumer Price Index by group (since 1993)
#'
#'  @description Monthly inflation data of Spain by group of goods since 1993.
#'
#' \item{periodo}{The last day of the month of each row, in date format.}
#' \item{grupo}{The label 'general' is for the generic inflation data. Each group is identified by aa index in the range G01 to G12. See 'ipc_clas_grupos' for the actual meaning of each group.}
#' \item{dato}{The type of datum for each row: 'mensual' is the monthly inflation rate, 'anual' the inter-annual inflation rate and 'acumulada' the cumulative inflation rate for the year.}
#' \item{valor}{the inflation rate, in percentage.}
#' }
#'
#' @examples
#'
#' ipc_hist_grupos
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipc_hist_grupos'

#' Spanish Consumer Price Index and inflation rates by autonomous community and group (since 2002)
#'
#' @description Monthly Consumer Price Index and inflation rates of Spain and autonomos communities by groups of goods since 2002. Inflation rates are computed as variations of the Consumer Price Index (base of 31 May 2016 for all Spain).
#'
#'\describe{
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{periodo}{The last day of the month of each row, in date format.}
#' \item{grupo}{The label 'general' is for the generic inflation data. Each group is identified by an index in the range G01 to G12. See 'ipc_clas_grupos' for the actual meaning of each group.}
#' \item{dato}{The type of datum for each row: 'index' is the Consumer Price Index,  'mensual' is the monthly inflation rate, 'anual' the inter-annual inflation rate and 'acumulada' the cumulative inflation rate for the year.}
#' \item{valor}{for rows with dato equal to 'indice' the Consumer Price Index,  inflation rate in percentage for the rest of values.}
#' }
#' @examples
#'
#' ipc_ccaa
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipc_ccaa'


#' Spanish Consumer Price Index and inflation rates by classification level  (since 2002)
#'
#' @description Monthly Consumer Price Index and inflation rates of Spain by classification level of goods since 2002. Inflation rates are computed as variations of the Consumer Price Index (base of 31 May 2016 for all Spain).
#'
#'\describe{
#' \item{periodo}{The last day of the month of each row, in date format.}
#' \item{nivel}{The aggregation level of the group for each row. See 'ipc_clas_grupos' for the actual meaning of each group.}
#' \item{grupo}{The label 'general' is for the generic inflation data. Each group is identified by an index in the range G01 to G12. See 'ipc_clas_grupos' for the actual meaning of each group.}
#' \item{dato}{The type of datum for each row: 'index' is the Consumer Price Index,  'mensual' is the monthly inflation rate, 'anual' the inter-annual inflation rate and 'acumulada' the cumulative inflation rate for the year.}
#' \item{valor}{for rows with dato equal to 'indice' the Consumer Price Index,  inflation rate in percentage for the rest of values.}
#' }
#' @examples
#'
#' ipc_clasif
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipc_clasif'

#' Classification levels for goods to compute the Spanish Consumer Price Index
#'
#' @description Spanish names of the groupings of goods use to compute the Consumer Price Index in Spain.
#'
#' \describe{
#' \item{label}{The classification level, as it appears on the original INE datasets.}
#' \item{nivel}{From larger to smaller level of aggregation we have'grupos', 'subgrupos', 'clases' and 'subclases'. 'rubricas' and 'grupos_especiales' are alternative classifications.}
#' \item{codigo}{The label used in the 'grupo' variable in the datasets of Spanish Consumer Price Index. The global Consumer Price Index has the code 'general'.}
#' \item{nombre}{The name of the classification level, edited from the original names in the original INE datasets.}
#' }
#' @examples
#'
#' ipc_clas_grupos
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipc_clas_grupos'

#' Names and labels of data provided in the Consumer Price Index databases
#'
#' @description Names and labels of data provided in the Consumer Price Index databases.
#'
#' \describe{
#' \item{dato}{The Spanish name of each type of data.}
#' \item{dato_label}{The label used in the 'dato' variable of the Consumer Price Index datasets.}
#' }
#'
#' @examples
#'
#' ipc_valores
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipc_valores'


