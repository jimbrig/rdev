
#  ------------------------------------------------------------------------
#
# Title : zzz.R - onLoad & onAttach & initialization
#    By : Jimmy Briggs
#  Date : 2026-05-31
#
#  ------------------------------------------------------------------------

# environment -----------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
#' @importFrom rlang new_environment
.pkg_env <- rlang::new_environment()

# initializers ----------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
#' @importFrom rlang on_load local_use_cli
rlang::on_load({
  rlang::local_use_cli()
})

# onLoad ----------------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
#' @importFrom rlang run_on_load
.onLoad <- function(libname, pkgname) {
  rlang::run_on_load()
}

# onAttach --------------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
.onAttach <- function(libname, pkgname) {
  if (getOption("rdev.banner", default = FALSE)) {
    packageStartupMessage(pkg_startup_msg())
  }
}

# onUnload --------------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
.onUnload <- function(libpath) {
}

# onDetach --------------------------------------------------------------------------------------------------------

#' @keywords internal
#' @noRd
.onDetach <- function(libpath) {
}
