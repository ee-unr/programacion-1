% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scripts.R
\name{termina_en_vocal}
\alias{termina_en_vocal}
\title{Verificación de última letra}
\usage{
termina_en_vocal(palabra)
}
\arguments{
\item{palabra}{Una cadena de texto}
}
\value{
TRUE si termina en vocal, FALSE si no
}
\description{
Esta función devuelve TRUE si la última letra en una cadena de texto es vocal.
}
\details{
Si \code{palabra} no es una cadena de texto, se produce un error.
}
\examples{
termina_en_vocal("casa")
termina_en_vocal("montes")

}
