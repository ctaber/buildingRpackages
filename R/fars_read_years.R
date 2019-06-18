#' Create File for All Valid Years Provided
#'
#' This function take a vector or list of years and creates a filename for all years provided.
#' Provides an error message if invalid year supplied.
#'
#' @param years Container of years to create filenames for
#'
#' @importFrom dplyr mutate select %>%
#'
#' @return Returns a tibble with columns MONTH, year from existing files with those columns and year values.  Returns a message stating invalid year and returns NULL if year does not exist.
#'
#' @examples
#' fars_read_years(c(2013,2014,2017))
#'
#' @export

fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(system.file('extdata', file, package='buildingRpackages'))
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}

