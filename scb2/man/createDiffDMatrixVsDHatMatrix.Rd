% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/createDiffDMatrixVsDHatMatrix.R
\name{createDiffDMatrixVsDHatMatrix}
\alias{createDiffDMatrixVsDHatMatrix}
\title{createDiffDMatrixVsDHatMatrix}
\usage{
createDiffDMatrixVsDHatMatrix(dMatrix, dHatMatrix)
}
\arguments{
\item{dMatrix}{A dMatrix}

\item{dHatMatrix}{A dHatMatrix}
}
\value{
Returning a two-dimensional array.
}
\description{
Creating a two-dimensional array of dimensions that cover both \code{dMatrix} and \code{dHatMatrix} data area.
}
\examples{
dMatrix <- createDMatrix(size = 10, sigma = 1, psi = 0.5)
original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
betaArray <- createBetaArray <- function(original, rho = 0.5)
dHatMatrix <- createDHatMatrix(betaArray, size = 10)
createDiffDMatrixVsDHatMatrix(dMatrix, dHatMatrix)

}
