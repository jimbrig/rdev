# Normalize Path

Simple wrapper around
[`base::normalizePath()`](https://rdrr.io/r/base/normalizePath.html)
with defaults that set `winslash` to `"/"` for better cross-platform
interoperability.

## Usage

``` r
normalize_path(path, winslash = "/", ...)
```

## Arguments

- path:

  character vector of file paths.

- winslash:

  the separator to be used on Windows – ignored elsewhere. Must be one
  of `c("/", "\\")`.

- ...:

  Arguments passed on to
  [`base::normalizePath`](https://rdrr.io/r/base/normalizePath.html)

  `mustWork`

  :   logical: if `TRUE` then an error is given if the result cannot be
      determined; if `NA` then a warning.

## Value

A character vector.

If an input is not a real path the result is system-dependent (unless
`mustWork = TRUE`, when this should be an error). It will be either the
corresponding input element or a transformation of it into an absolute
path.

Converting to an absolute file path can fail for a large number of
reasons. The most common are

- One of more components of the file path does not exist.

- A component before the last is not a directory, or there is
  insufficient permission to read the directory.

- For a relative path, the current directory cannot be determined.

- A symbolic link points to a non-existent place or links form a loop.

- The canonicalized path would be exceed the maximum supported length of
  a file path.
