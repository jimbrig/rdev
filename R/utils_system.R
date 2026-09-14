
#  ------------------------------------------------------------------------
#
# Title : System Utilities
#    By : Jimmy Briggs
#  Date : 2026-09-14
#
#  ------------------------------------------------------------------------

# envvars -----------------------------------------------------------------

# sys_get_env <- function(x = NULL, unset = NULL) {
#   hold <- Sys.getenv(x = x, unset = "", names = NA)
#   if (!nzchar(hold)) return(unset)
#   normalize_path(hold)
# }

# sys_check_env <- function(x)

# info --------------------------------------------------------------------

#' System Information
#'
#' @description
#' Simple wrapper around [base::Sys.info()].
#'
#' @export
#'
#' @seealso [base::Sys.info()]
sys_info <- function() {
  Sys.info()
}

# which -------------------------------------------------------------------

#' `sys_which` - System `which`
#'
#' @description
#' Lightweight, convenience wrapper around [base::Sys.which()] and [base::normalizePath()].
#'
#' Also provided via the alias `sys_where()` meant to associate with `where.exe` on Windows.
#'
#' @param x Passed to `Sys.which()` `names` argument.
#' @inheritDotParams normalize_path
#'
#' @returns
#' Character vector of paths, if found. If not found returns `NULL` instead of `""`.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' sys_which("gdal")
#' }
sys_which <- function(x, winslash = "/", ...) {
  hold <- Sys.which(x)
  if (!nzchar(hold)) return(NULL)
  normalize_path(hold, winslash = winslash, ...)
}

#' @rdname sys_which
#' @export
sys_where <- sys_which

# platform & operating system -------------------------------------------------------------------------------------

#' `sys_platform` - System Platform
#'
#' @description
#' Get the current machine's platform (operating system "family")
#'
#' @returns
#' Character string resulting from `.Platform$OS.type`
#'
#' @export
#'
#' @examples
#' \dontrun{
#' sys_platform()
#' }
sys_platform <- function() {
  .Platform$OS.type
}

#' `sys_os` - System OS Name
#'
#' @description
#' Get the current machine's operating system name.
#'
#' @returns
#' Character string resulting from `Sys.info()[["sysname"]]`, which will be one of c("windows", "linux", "darwin", etc.)
#' depending on the system.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' sys_os()
#' }
sys_os <- function() {
  Sys.info()[["sysname"]]
}

# process id ------------------------------------------------------------------------------------------------------

#' `sys_pid` - System Process ID
#'
#' @description
#' Get the current process ID of the R session.
#'
#' @returns
#' Integer representing the current process ID.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' sys_pid()
#' }
sys_pid <- function() {
  Sys.getpid()
}

# path ------------------------------------------------------------------------------------------------------------

#' `sys_path` - System PATH
#'
#' @description
#' Get the Current Machine's PATH Environment Variable as a Character Vector
#'
#' @param filter Optional character string. If provided, only paths containing this string will be returned.
#'
#' @returns
#' Character vector of paths from the system's `PATH` environment variable, split by the appropriate path separator
#' for the operating system. If `filter` is provided, only paths containing the filter string are included in the
#' returned vector. If no paths match the filter, an empty character vector is returned: `character(0)`.
#'
#' If `filter` is provided, only paths containing the filter string are returned.
#'
#' @export
#'
#' @importFrom stringr str_split
#'
#' @examples
#' \dontrun{
#' sys_path()
#' }
sys_path <- function(filter = NULL) {
  path_sep <- .Platform$path.sep
  hold <- Sys.getenv("PATH") |> stringr::str_split(pattern = path_sep) |> unlist() |> normalize_path()
  if (is.null(filter)) return(hold)
  hold[stringr::str_detect(hold, filter)]
}

# error codes -----------------------------------------------------------------------------------------------------

#' `sys_error_code` - System Error Codes
#'
#' @description
#' Get system error codes and their descriptions. If a specific code is provided, returns the
#' name, value, and description for that code. If no code is provided, returns a tibble of all system error codes.
#'
#' @param code (Optional) Integer or character string representing the system error code to look up.
#'   If `NULL` (the default), returns all system error codes. Can be one or more codes to filter by.
#'
#' @returns
#' A [tibble::tibble()] with the `name`, `value`, and `description` of the system error code(s).
#' If one or more codes are provided, returns only the matching code(s). If no codes are found, returns `NULL` invisibly.
#'
#' @export
#'
#' @seealso [ps::errno()] for the underlying system error codes data.
#'
#' @importFrom ps errno
#' @importFrom tibble as_tibble
#' @importFrom dplyr filter
#' @importFrom cli cli_alert_warning
#'
#' @examples
#' \dontrun{
#' # Get all system error codes
#' sys_error_code()
#'
#' # Get specific error code information
#' sys_error_code(2)  # Example: ENOENT (No such file or directory)
#' }
sys_error_code <- function(code = NULL) {
  errs <- ps::errno() |> tibble::as_tibble()
  if (is.null(code)) {
    return(errs)
  }
  code <- as.integer(code)
  if (!code %in% errs$value) {
    cli::cli_alert_warning("Error code {.val {code}} not found in system error codes.")
    return(invisible(NULL))
  }
  errs |> dplyr::filter(.data$value %in% .env$code)
}




