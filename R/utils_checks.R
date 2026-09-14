
#  ------------------------------------------------------------------------
#
# Title : Check Utilities
#    By : Jimmy Briggs
#  Date : 2026-09-14
#
#  ------------------------------------------------------------------------

# topic -----------------------------------------------------------------------------------------------------------

#' Check Functions
#'
#' @name checks
#' @family checks
#' @family utils
#'
#' @description
#' Collection of various checking functions primarily used for incorporating argument validation checks for package
#' functions.
#'
#' These check functions act as assertions, and will either return the provided objects invisibly, or throw exceptions.
NULL

# inherits ------------------------------------------------------------------------------------------------------

#' Class Inheritance Checks
#'
#' @description
#' These functions perform checks that assert the underlying class of objects passed to them.
#'
#' - `check_inherits()`: checks that object `x` is of class `class` using [base::inherits()]
#' - `check_inherits2()`: checks that object `x` is of class `class` using [base::.class2()]
#' - `check_inherits_any()`: checks that object `x` is at least one of the provided `classes` via [rlang::inherits_any()]
#' - `check_inherits_all()`: checks that object `x` is all of the provided `classes` via [rlang::inherits_all()]
#'
#' If validation fails for any of these functions, an error is thrown via `check_abort()` displaying a friendly
#' error message.
#'
#' @param x The object to check.
#' @param class,classes The name of the class or classes to use during checking.
#' @inheritParams rlang::args_error_context
#'
#' @returns
#' If checks pass, invisibly returns the provided `x` object. If checks fail, a condition error is thrown.
#'
#' @export
check_inherits <- function(x, class, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!inherits(x, class)) {
    check_abort("{.arg {arg}} must inherit from class {.cls {class}}, not {.obj_type_friendly {x}}.", call = call)
  }
  invisible(x)
}

#' @rdname check_inherits
#' @export
check_inherits2 <- function(x, class, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!(class %in% .class2(x))) {
    check_abort("{.arg {arg}} must inherit from class {.cls {class}}, not {.cls {.class2(x)}}", call = call)
  }
  invisible(x)
}

#' @rdname check_inherits
#' @export
#' @importFrom rlang inherits_any
check_inherits_any <- function(x, classes, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!rlang::inherits_any(x, classes)) {
    check_abort(
      "{.arg {arg}} must inherit from one of the classes: {.cls {classes}}, not {.obj_type_friendly {x}}.",
      call = call
    )
  }
  invisible(x)
}

#' @rdname check_inherits
#' @export
#' @importFrom rlang inherits_all
check_inherits_all <- function(x, classes, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!rlang::inherits_all(x, classes)) {
    check_abort(
      "{.arg {arg}} must inherit from all of the classes: {.cls {classes}}, not {.obj_type_friendly {x}}.",
      call = call
    )
  }
  invisible(x)
}
