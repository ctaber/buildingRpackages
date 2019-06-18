#' Import File as Tibble
#'
#' This is a simple function that imports a csv file as a tibble dataframe.
#' The function check if the file exists, and if it does, reads in the file and converts it to a tbl_df.
#' An error will occur if filename doe not exist.
#'
#' @param filename The filename the function reads.
#'
#' @importFrom readr read_csv
#'
#' @importFrom dplyr tbl_df
#'
#' @return The function returns a tbl_df.
#'
#' @examples
#' fars_read('this_file_does_not_exist.csv')
#'
#' @export

fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
