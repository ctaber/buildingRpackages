% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_read_years.R
\name{fars_read_years}
\alias{fars_read_years}
\title{Create File for All Valid Years Provided}
\usage{
fars_read_years(years)
}
\arguments{
\item{years}{Container of years to create filenames for}
}
\value{
Returns a tibble with columns MONTH, year from existing files with those columns and year values.  Returns a message stating invalid year and returns NULL if year does not exist.
}
\description{
This function take a vector or list of years and creates a filename for all years provided.
Provides an error message if invalid year supplied.
}
\examples{
\dontrun{fars_read_years(c(2013,2014,2017))}

}
