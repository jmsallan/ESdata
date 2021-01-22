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

#' Historical series of inflation rates (since 1961)
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

#' Historical series of inflation rates by group (since 1993)
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
#' @description Monthly Consumer Price Index (Índice de Precios al Consumo) and inflation rates of Spain and autonomos communities by groups of goods since 2002. Inflation rates are computed as variations of the Consumer Price Index (base of 31 May 2016 for all Spain).
#'
#'\describe{
#' \item{periodo}{The last day of the month of each row, in date format.}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
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

#' Weights of groups in the Consumer Price Index by region and year
#'
#' @description Weights of grupos in the Consumer Price index by region and year. The sum of weights for a region and year is equal to 1000.
#'
#' \describe{
#' \item{periodo}{The year of the weight datum, in numeric format}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{grupo}{Each group is identified by aa index in the range G01 to G12. See 'ipc_clas_grupos' for the actual meaning of each group.}
#' \item{valor}{The value of the weight, ranging from 0 to 1000.}
#' }
#' @examples
#'
#' ipc_pond
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipc_pond'

#' Spanish Housing Price Index by autonomous community
#'
#' @description Quarterly Housing Price Index (Índice de Precios de la vivienda) of Spain and autonomos communities.
#'
#'\describe{
#' \item{periodo}{The last day of the qaurter of each row, in date format.}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{tipo}{The label 'general' is for the generic housing prices, 'nueva" for new housing, and 'segunda_mano' for second-hand housing.}
#' \item{dato}{The type of datum for each row: 'index' is the Housing Price Index,  'mensual' is the monthly variation of the index, 'anual' the inter-annual variation of the index and 'acumulada' the cumulative variation of the index for the year.}
#' \item{valor}{for rows with dato equal to 'indice' the Jousing Price Index,  housing price variation in percentage for the rest of values.}
#' }
#' @examples
#'
#' ipv
#'
#' @source \url{https://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736152838&menu=ultiDatos&idp=1254735976607}
#'
'ipv'

#' Weights of groups in the Housing Price Index by region and year
#'
#' @description Weights of new and seconds hand house in the Housing Price index by region and year. The sum of weights for a region and year is equal to 100.
#'
#' \describe{
#' \item{periodo}{The year of the weight datum, in numeric format.}
#' \item{region}{The ISO 3166-2 code for the region of each row. Spanish data have the 'ES' label here.}
#' \item{tipo}{The label 'nueva" si for new housing, and 'segunda_mano' for second-hand housing.}
#' \item{valor}{The value of the weight, ranging from 0 to 100.}
#' }
#' @examples
#'
#' ipv_pond
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
#'
'ipv_pond'

#' Gross domestic product (GDP) of Spain, production approach
#'
#' @description Quearterly Gross Domestic product of spain, calculated through the production apprach. Includes the final value of GDP and its aggregates. Includes indices and total value for each aggregate. Data from 1995 to present.
#'
#' \describe{
#' \item{periodo}{The last day of the quarter of each row, in date format.}
#' \item{agregado}{The code for each aggregate of the GDP through the production approach. See 'pib_oferta_agregados' for a list of aggregates (in Spanish).}
#' \item{ajuste}{'ajustad' means that data are adjusted from seasonality and calendar, and 'no_ajustado' means that are not adjusted.}
#' \item{tipo}{Rows with 'valor' contain the actual GDP value, and rows with 'indice' and indexed value.}
#' \item{dato}{The type of datum for each row. 'base' means the actual value, 'var_trim' the quarterly variation, 'var_anual' the annual variation, 'ap_trim' the quarterly contribution and 'ap_anual' the annual contribution.}
#' \item{valor}{The value of the datum for each row.}
#' }
#' @examples
#'
#' pib_pm_oferta
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=5614&capsel=5615}
#'
'pib_pm_oferta'

#' Gross domestic product (GDP) of Spain, expenditure approach
#'
#' @description Quearterly Gross Domestic product of Spain, calculated through the expenditure apprach. Includes the final value of GDP and its aggregates. Includes indices and total value for each aggregate. Data from 1995 to present.
#'
#' \describe{
#' \item{periodo}{The last day of the quarter of each row, in date format.}
#' \item{agregado}{The code for each aggregate of the GDP through the production approach. See 'pib_demanda_agregados' for a list of aggregates (in Spanish).}
#' \item{ajuste}{'ajustad' means that data are adjusted from seasonality and calendar, and 'no_ajustado' means that are not adjusted.}
#' \item{tipo}{Rows with 'valor' contain the actual GDP value, and rows with 'indice' and indexed value.}
#' \item{dato}{The type of datum for each row. 'base' means the actual value, 'var_trim' the quarterly variation, 'var_anual' the annual variation, 'ap_trim' the quarterly contribution and 'ap_anual' the annual contribution.}
#' \item{valor}{The value of the datum for each row.}
#' }
#' @examples
#'
#' pib_pm_demanda
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=5614&capsel=5615}
#'
'pib_pm_demanda'


#' Gross domestic product (GDP) of Spain, income approach
#'
#' @description Quearterly Gross Domestic product of spain, calculated through the income apprach. Includes the final value of GDP and its aggregates. Includes total value for each aggregate. Data from 1995 to present.
#'
#' \describe{
#' \item{periodo}{The last day of the quarter of each row, in date format.}
#' \item{agregado}{The code for each aggregate of the GDP through the income approach. See 'pib_rentas_agregados' for a list of aggregates (in Spanish).}
#' \item{ajuste}{'ajustad' means that data are adjusted from seasonality and calendar, and 'no_ajustado' means that are not adjusted.}
#' \item{dato}{The type of datum for each row. 'base' means the actual value, 'var_trim' the quarterly variation and 'var_anual' the annual variation.}
#' \item{valor}{The value of the datum for each row.}
#' }
#' @examples
#'
#' pib_pm_rentas
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=5614&capsel=5615}
#'
'pib_pm_rentas'

#' Aggregates of the Gross Domestic Product through the production  approach
#'
#' @description The code used to represent the GDP aggregates in 'pib_pm_oferta' and the name of each aggregate as presented in original data.
#'
#' \describe{
#' \item{agr_label}{The label used in the 'agregado' field of 'pib_pm_oferta'.}
#' \item{agregado}{The actual name of the aggregate as presented in original data (in Spanish).}
#' }
#' @examples
#'
#' pib_oferta_agregados
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=5614&capsel=5615}
#'
'pib_oferta_agregados'

#' Aggregates of the Gross Domestic Product through the expenditure approach
#'
#' @description The code used to represent the GDP aggregates in 'pib_pm_demanda' and the name of each aggregate as presented in original data.
#'
#' \describe{
#' \item{agr_label}{The label used in the 'agregado' field of 'pib_pm_demanda'.}
#' \item{agregado}{The actual name of the aggregate as presented in original data (in Spanish).}
#' }
#' @examples
#'
#' pib_demanda_agregados
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=5614&capsel=5615}
#'
'pib_demanda_agregados'

#' Aggregates of the Gross Domestic Product through the income approach
#'
#' @description The code used to represent the GDP aggregates in 'pib_pm_rentas' and the name of each aggregate as presented in original data.
#'
#' \describe{
#' \item{agr_label}{The label used in the 'agregado' field of 'pib_pm_rentas'.}
#' \item{agregado}{The actual name of the aggregate as presented in original data (in Spanish).}
#' }
#' @examples
#'
#' pib_rentas_agregados
#'
#' @source \url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=5614&capsel=5615}
#'
'pib_rentas_agregados'
