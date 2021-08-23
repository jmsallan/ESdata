#' weekly report of deaths in Spain by province
#'
#' @description Number of reported deaths for each week for each province of Spain
#'
#' \describe{
#' \item{year}{Year of datum.}
#' \item{semana}{Number of week of datum.}
#' \item{region}{The ISO 3166-2 code for the province of each row. Spanish data have the 'ES' label here.}
#' \item{valor}{The value of the datum for each row.}
#' }
#' @examples
#'
#' defunciones
#'
#' @source \url{https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/35176.csv?nocab=1}
#'
'defunciones'

#' weekly report of deaths in Spain by province, gender and age group
#'
#' @description Number of reported deaths for each week for each province of Spain, split by gender and age group
#'
#' \describe{
#' \item{year}{Year of datum.}
#' \item{semana}{Number of week of datum.}
#' \item{region}{The ISO 3166-2 code for the province of each row. Spanish data have the 'ES' label here.}
#' \item{sexo}{The gender for each row: `total' for the sum of both genders, 'hombres' for men and 'mujeres' for women.}
#' \item{edad}{The age segment for each row.}
#' \item{valor}{The value of the datum for each row.}
#' }
#' @examples
#'
#' defunciones_sexo_edad
#'
#' @source \url{https://www.ine.es/jaxiT3/files/t/es/csv_bdsc/36166.csv?nocab=1}
#'
'defunciones_sexo_edad'

#' Spanish population by region (province), age and gender
#'
#' @description The Spanish population by region, age and gender. Updated yearly.
#'
#' \describe{
#' \item{periodo}{The year of the datum.}
#' \item{region}{The ISO 3166-2 code for the province of each row. Spanish data have the 'ES' label.}
#' \item{edad}{The age segment for each row.}
#' \item{sexo}{The gender for each row: `total' for the sum of both genders, 'hombres' for men and 'mujeres' for women.}
#' \item{valor}{The value of the datum of each row..}
#' }
#'
#' @examples
#'
#' pob_prov_edad
#'
#' @source \url{https://www.ine.es/jaxi/files/_px/es/csv_bdsc/t20/e245/p08/l0/03002.csv_bdsc?nocab=1}
#'
'pob_prov_edad'

