\encoding{latin1}
\name{arrayTrend}
\alias{arrayTrend}
\alias{arrayTrend.default}
\alias{arrayTrend.arrayCGH}
\title{Spatial trend of microarray spots statistic}
\description{
The function \code{arrayTrend} computes the spatial trend.
}
\usage{
\method{arrayTrend}{default}(Statistic, Col, Row, \ldots)
\method{arrayTrend}{arrayCGH}(arrayCGH, variable, \ldots)
}

\arguments{
  \item{Statistic}{Statistic to be smoothed.}
  \item{Col}{Vector of columns coordinates.}
  \item{Row}{Vector of rows coordinates.}
  \item{arrayCGH}{Object of class \code{\link[GLAD]{arrayCGH}}.}
  \item{variable}{Variable to be smooth.}
  \item{...}{Parameters to be passed to \code{\link[stats]{loess}} function.}
}

\details{Spatial trend of microarray spots statistic.}

\value{
  Either a data frame with elements :
  \item{Trend}{Trend fitted by \code{\link[stats]{loess}} function.}
  \item{Col}{Vector of columns coordinates.}
  \item{Row}{Vector of rows coordinates.}
  or the element \code{Trend} is added to the data.frame \code{arrayValues}
  of the \code{arrayCGH} object.
}

\author{Philippe Hupé, \email{philippe.hupe@curie.fr}.}

\note{People interested in tools for array-CGH analysis can
  visit our web-page: \url{http://bioinfo.curie.fr}.}

\seealso{\code{\link[stats]{loess}}, \code{\link[stats]{loess.control}}.}

\keyword{smooth}
\keyword{loess}
\keyword{spatial}

\examples{
data(spatial)  ## arrays with local spatial effects

edgeTrend <- arrayTrend(edge, "LogRatio", span=0.03, degree=1,
iterations=3, family="symmetric")
GLAD::arrayPlot(edgeTrend, "Trend", main="Spatial trend of array CGH", bar="v")
}

\references{
  P. Neuvial, P. Hup?, I. Brito, S. Liva, E. Mani?, C. Brennetot,
  A. Aurias, F. Radvanyi, and E. Barillot. \emph{Spatial normalization
    of array-CGH data}. BMC Bioinformatics, 7(1):264. May 2006.
}

