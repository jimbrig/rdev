
#  ------------------------------------------------------------------------
#
# Title : Package Utilities
#    By : Jimmy Briggs
#  Date : 2026-09-06
#
#  ------------------------------------------------------------------------

# meta ------------------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
pkg_name <- function() {
  "rdev"
}

#' @keywords internal
#' @noRd
#' @importFrom utils packageVersion
pkg_version <- local({
  version <- NULL
  function() {
    if (is.null(version)) {
      version <<- as.character(utils::packageVersion(pkg_name()))
    }
    version
  }
})

# user agent ------------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
pkg_user_agent <- function() {
  paste0(pkg_name(), "/", pkg_version())
}

# system file -----------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
pkg_sys <- function(...) {
  normalizePath(system.file(..., package = pkg_name()), winslash = "/")
}

# startup message -------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
#' @importFrom crayon bold cyan yellow
pkg_startup_msg <- function() {
  msg_banner <- paste0(crayon::cyan(crayon::bold(pkg_banner())), "\n")
  msg_title <- paste0(crayon::bold(crayon::yellow(pkg_name(), paste0("v", pkg_version()))), "\n")
  msg_desc <- crayon::bold(crayon::yellow("Modern R Developer Toolkit"))
  invisible(paste0(msg_banner, msg_title, msg_desc))
}

# banner ----------------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
pkg_banner <- function() {
  .pkg_banner_str
}

#' @keywords internal
#' @noRd
#' @seealso https://manytools.org/hacker-tools/ascii-banner/
.pkg_banner_str <- r"(
             __
   _________/ /__ _   __
  / ___/ __  / _ \ | / /
 / /  / /_/ /  __/ |/ /
/_/   \__,_/\___/|___/

)"
