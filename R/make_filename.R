#' Make Filename
#'
#' This function take a year, converts it to an interger, and prints the new file name with the year appended to the end as a character vector (eg. "accident_1996.csv.bz2")
#' A warning will occur if year is not supplied as a numeric value.
#'
#' @param year Numeric year value.
#'
#' @return Returns a character vector containing a formatted combination of text (eg. "accident_") and numeric year variable supplied.
#'
#' @examples
#' make_filename(1996)
#'
#' @export

make_filename <- function(year) {
  year <- as.integer(year)
  sprintf('accident_%d.csv.bz2', year)
}
