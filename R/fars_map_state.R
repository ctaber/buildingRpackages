#' Create Graph of Accidents by State
#'
#' This function returns a plot of all accidents in a state for the year provided.
#' An error will occur if invalid state.num provided.
#' If no accidents exist for state.num and year provided, a message will be reutrned stating this.
#'
#' @param state.num id of state of interest
#'
#' @param year Year to plot accidents for.
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @detials Searches for the state.num provided, for the year provided, obtains all the data related to accidents, and uses latitude and longitue to plot the location of the accidents.
#'
#' @return Returns a state map for the state.num provided for the year provided, with a point in the geographic location of each accident that occured.
#'
#' @exmaples
#' fars_map_state(44,2013)
#'
#' @export

fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(system.file("extdata", filename, package='buildingRpackages'))
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
