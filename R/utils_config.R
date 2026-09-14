
#  ------------------------------------------------------------------------
#
# Title : Configuration Utilities
#    By : Jimmy Briggs
#  Date : 2026-09-14
#
#  ------------------------------------------------------------------------

#' Read `.Renviron` File
#'
#' @description
#' Simple wrapper around [base::readRenviron()] to read a `.Renviron` file from a specified path.
#' If no path is provided, it defaults to the current working directory.
#'
#' @param path The directory path where the `.Renviron` file is located. If `NULL`, defaults to the current working directory.
#'
#' @returns
#' Invisibly returns `NULL`. The function is called for its side effect of loading environment variables into the R session.
#'
#' @export
#'
#' @importFrom cli cli_alert_success
read_renviron <- function(path = NULL) {
  if (is.null(path)) {
    path <- getwd()
  }
  file <- file.path(path, ".Renviron")
  if (!file.exists(file)) {
    return(invisible(NULL))
  }
  readRenviron(file)
  cli::cli_alert_success("Loaded environment variables from {.file {file}}.")
}
