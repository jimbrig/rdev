
#  ------------------------------------------------------------------------
#
# Title : Path Utilities
#    By : Jimmy Briggs
#  Date : 2026-09-14
#
#  ------------------------------------------------------------------------

#' Normalize Path
#'
#' @description
#' Simple wrapper around [base::normalizePath()] with defaults that set `winslash`
#' to `"/"` for better cross-platform interoperability.
#'
#' @inheritParams base::normalizePath path winslash
#' @inheritDotParams base::normalizePath
#'
#' @inherit base::normalizePath return
#'
#' @export
normalize_path <- function(path, winslash = "/", ...) {
  normalizePath(path, winslash = winslash, mustWork = FALSE, ...)
}


# XDG ---------------------------------------------------------------------

xdg_config_dir <- function(...) {

}

