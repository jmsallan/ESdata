% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hello.R
\docType{data}
\name{ipc_hist}
\alias{ipc_hist}
\title{Historical series of inflation rates (since 1961)}
\format{
An object of class \code{tbl_df} (inherits from \code{tbl}, \code{data.frame}) with 2171 rows and 3 columns.
}
\source{
\url{https://www.ine.es/dynt3/inebase/es/index.htm?padre=3470&capsel=3466}
}
\usage{
ipc_hist
}
\description{
Monthly inflation data of Spain since 1961

\describe{
\item{periodo}{The last day of the month of each row, in date format.}
\item{dato}{The type of datum for each row: 'mensual' is the monthly inflation rate, 'anual' the inter-annual inflation rate and 'acumulada' the cumulative inflation rate for the year.}
\item{valor}{the inflation rate, in percentage.}
}
}
\examples{

ipc_hist

}
\keyword{datasets}
