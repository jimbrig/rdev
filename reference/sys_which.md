# `sys_which` - System `which`

Lightweight, convenience wrapper around
[`base::Sys.which()`](https://rdrr.io/r/base/Sys.which.html) and
[`base::normalizePath()`](https://rdrr.io/r/base/normalizePath.html).

Also provided via the alias `sys_where()` meant to associate with
`where.exe` on Windows.

## Usage

``` r
sys_which(x, winslash = "/", ...)

sys_where(x, winslash = "/", ...)
```

## Arguments

- x:

  Passed to [`Sys.which()`](https://rdrr.io/r/base/Sys.which.html)
  `names` argument.

- ...:

  Arguments passed on to
  [`normalize_path`](http://docs.jimbrig.com/rdev/reference/normalize_path.md)

  `path`

  :   character vector of file paths.

  `winslash`

  :   the separator to be used on Windows – ignored elsewhere. Must be
      one of `c("/", "\\")`.

## Value

Character vector of paths, if found. If not found returns `NULL` instead
of `""`.

## Examples

``` r
if (FALSE) { # \dontrun{
sys_which("gdal")
} # }
```
