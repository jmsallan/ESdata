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
#' @source \url{https://es.wikipedia.org/wiki/ISO_3166-2:ES}
#'
#' @examples
#'
#' ccaa_iso
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

