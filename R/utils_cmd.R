
#' Command Utilities
#'
#' @name utils_cmd
#'
#' @description
#' Utilities for running system commands and tools like `git`, `docker`, etc.
#'
#' These functions leverage [sys::exec_internal()] to run commands and capture their output.
#'
#' - `cmd()`: Run a generic command.
#' - `git()`: Run a `git` command.
#' - `gh()`: Run a GitHub CLI (`gh`) command.
#' - `docker()`: Run a `docker` command.
#'
#' @param cmd The command to run.
#' @param ... Additional arguments to pass to the command.
#' @param .timeout The timeout in seconds for the command to complete. Default is 60 seconds.
#' @param .echo Logical. If `TRUE`, the output will be printed to the console. Default is `TRUE`.
#'
#' @returns
#' The output of the command.
#'
#' @importFrom sys exec_internal as_text
#' @importFrom cli cli_abort
#'
#' @examples
#' #--- git ---
#' \dontrun{
#' # get git version
#' git("--version")
#' # git status
#' git("status")
#' # git commit
#' git("commit", "-m", "Initial commit")
#' }
#'
#' #--- gh ---
#' \dontrun{
#' # command used to initialize this repository on github:
#' gh("repo", "create", "landrise/landrise.utils", "--private", "--source=.", "--remote=upstream")
#' }
#'
#' # --- docker ---
#' \dontrun{
#' # get docker help
#' docker("--help")
#' # list docker images
#' docker("images")
#' # run a docker container
#' docker("run", "--rm", "hello-world")
#' }
#'
#' # --- npx ---
#' \dontrun{
#' # get npx help
#' npx("--help")
#' # create a new react app
#' npx("create-react-app", "my-app")
#' # run repomix tool
#' npx("repomix", "--help")
#' }
NULL

# cmd -------------------------------------------------------------------------------------------------------------

#' @rdname utils_cmd
#' @export
cmd <- function(cmd, ..., .timeout = 60, .echo = TRUE) {

  args <- c(cmd, ...)

  res <- sys::exec_internal(
    cmd = cmd,
    args = args,
    timeout = .timeout,
    error = FALSE
  )

  if (res$status != 0) {
    cli::cli_abort(
      c(
        "Failed to run {.code {cmd}} command (exit code: {res$status}).",
        "x" = sys::as_text(res$stderr)
      )
    )
  }

  output <- sys::as_text(res$stdout)
  if (.echo) cat(output)
  invisible(output)

}



# git -------------------------------------------------------------------------------------------------------------

#' @rdname utils_cmd
#' @export
git <- function(cmd, ..., .timeout = 60, .echo = TRUE) {

  git_path <- Sys.which("git")
  if (git_path == "") cli::cli_abort("{.code git} is not installed or not found in the system {.envvar PATH}.")

  args <- c(cmd, ...)

  res <- sys::exec_internal(
    cmd = git_path,
    args = args,
    timeout = .timeout,
    error = FALSE
  )

  if (res$status != 0) {
    cli::cli_abort(
      c(
        "Failed to run {.code git {cmd}} command (exit code: {res$status}).",
        "x" = sys::as_text(res$stderr)
      )
    )
  }

  output <- sys::as_text(res$stdout)
  if (.echo) cat(output)
  invisible(output)

}

# gh --------------------------------------------------------------------------------------------------------------

#' @rdname utils_cmd
#' @export
gh <- function(cmd, ..., .timeout = 60, .echo = TRUE) {

  gh_path <- Sys.which("gh")
  if (gh_path == "") cli::cli_abort("{.code gh} is not installed or not found in the system {.envvar PATH}.")

  args <- c(cmd, ...)

  res <- sys::exec_internal(
    cmd = gh_path,
    args = args,
    timeout = .timeout,
    error = FALSE
  )

  if (res$status != 0) {
    cli::cli_abort(
      c(
        "Failed to run {.code gh {cmd}} command (exit code: {res$status}).",
        "x" = sys::as_text(res$stderr)
      )
    )
  }

  output <- sys::as_text(res$stdout)
  if (.echo) cat(output)
  invisible(output)

}




# docker ----------------------------------------------------------------------------------------------------------

#' @rdname utils_cmd
#' @export
docker <- function(cmd, ..., .timeout = 60, .echo = TRUE) {

  docker_path <- Sys.which("docker")
  if (docker_path == "") cli::cli_abort("{.code docker} is not installed or not found in the system {.envvar PATH}.")

  args <- c(cmd, ...)

  res <- sys::exec_internal(
    cmd = docker_path,
    args = args,
    timeout = .timeout,
    error = FALSE
  )

  if (res$status != 0) {
    cli::cli_abort(
      c(
        "Failed to run {.code docker {cmd}} command (exit code: {res$status}).",
        "x" = sys::as_text(res$stderr)
      )
    )
  }

  output <- sys::as_text(res$stdout)
  if (.echo) cat(output)
  invisible(output)

}

# npx -------------------------------------------------------------------------------------------------------------

#' @rdname utils_cmd
#' @export
npx <- function(cmd, ..., .timeout = 60, .echo = TRUE) {

  npx_path <- Sys.which("npx.cmd") |> normalizePath(winslash = "/", mustWork = FALSE)
  if (npx_path == "") cli::cli_abort("{.code npx} is not installed or not found in the system {.envvar PATH}.")

  args <- c(cmd, ...)

  res <- sys::exec_internal(
    cmd = npx_path,
    args = args,
    timeout = .timeout,
    error = FALSE
  )

  if (res$status != 0) {
    cli::cli_abort(
      c(
        "Failed to run {.code npx {cmd}} command (exit code: {res$status}).",
        "x" = sys::as_text(res$stderr)
      )
    )
  }

  output <- sys::as_text(res$stdout)
  if (.echo) cat(output)
  invisible(output)

}

