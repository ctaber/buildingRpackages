#' Provide a Summary of Counts for Each Year and Month Comination
#'
#' This funtion returns a tibble for each Year and Month combination that counts the total rows for each month, with each year as its own column.
#'
#' @params years Provide a list of years to summarize.
#'
#' @importFrom dplyr  bind_rows group_by summarize
#'
#' @importFrom tidyr spread
#'
#' @detials Uses dplyr to bind multiple dataframes into one, groups by year and month, counts the occurances of each year and month combinatio, and then uses tidyr to foramt the output with distinct months as rows and years as columns with the counts as the data.
#'
#' @return A tibble with MONTH as rows, years as columns, and counts of year and month combination as the values.
#'
#' @examples
#' fars_summarize_years(c(2013, 2014))
#'
#' @export

fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
   dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n())%>%
    tidyr::spread(year, n)
}

