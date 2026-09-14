
#  ------------------------------------------------------------------------
#
# Title : Package Documentation Script
#    By : Jimmy Briggs
#  Date : 2026-09-14
#
#  ------------------------------------------------------------------------

# roxygen2 --------------------------------------------------------------------------------------------------------

if (!file.exists("R/rdev-package.R")) usethis::use_package_doc()
desc::desc_set("Config/roxygen2/markdown", "TRUE")
desc::desc_set("Config/roxygen2/version", utils::packageVersion("roxygen2"))

fs::dir_create("man/figures")
fs::dir_create("man/fragments")
fs::dir_create("man/roxygen")
fs::file_create("man/roxygen/meta.R")

r"(

#  ------------------------------------------------------------------------
#
# Title : roxygen2 meta
#    By : Jimmy Briggs
#  Date : {Sys.Date()}
#
#  ------------------------------------------------------------------------

# https://roxygen2.r-lib.org/reference/load_options.html
list(
  markdown = TRUE,
  rd_family_title = list(
    sys = "System Functions",
    checks = "Check Functions",
    config = "Configuration Functions",
    utils = "Utility Functions",
    data = "Data Functions",
    tests = "Test Functions"
  )
)
)" |>
  glue::glue() |>
  writeLines(con = "man/roxygen/meta.R")


attachment::att_amend_desc(use.config = TRUE, update.config = TRUE, path.c = "dev/attachment.config.yml")


# readme ----------------------------------------------------------------------------------------------------------

usethis::use_readme_md()

# changelog -------------------------------------------------------------------------------------------------------

file.create("CHANGELOG.md")
usethis::use_build_ignore("CHANGELOG.md")
usethis::use_github_action(url = "https://github.com/noclocks/.github/blob/main/.github/workflows/changelog.yml")

# badges ----------------------------------------------------------------------------------------------------------

usethis::use_badge(badge_name = "Automate Changelog", href = "https://github.com/jimbrig/rdev/actions/workflows/changelog.yml", src = "https://github.com/jimbrig/rdev/actions/workflows/changelog.yml/badge.svg")

# vignettes -------------------------------------------------------------------------------------------------------

usethis::use_vignette("rdev", title = "Getting Started")

# images ----------------------------------------------------------------------------------------------------------

copy_pkg_img <- function(pkg_name, dest_path = file.path(this.path::this.proj(), "man", "figures")) {
  src_img_dir <- file.path(fs::path_package(pkg_name), "help", "figures")
  if (!dir.exists(src_img_dir)) return(NULL)
  src_img <- file.path(src_img_dir, "logo.png")
  if (!file.exists(src_img)) return(NULL)
  dst_img <- file.path(dest_path, paste0(pkg_name, ".png"))
  fs::file_copy(src_img, dst_img, overwrite = TRUE)
}

copy_pkg_img("shiny")
copy_pkg_img("rmarkdown")
copy_pkg_img("Rapp")
copy_pkg_img("attachment")
copy_pkg_img("pkgdown")
copy_pkg_img("testthat")
copy_pkg_img("progressr")
copy_pkg_img("plumber2")
copy_pkg_img("vctrs")

fs::file_copy(
  file.path(normalizePath(Sys.getenv("R_HOME"), winslash = "/"), "doc", "html", "Rlogo.svg"),
  "man/figures/R.svg"
)

# pkgdown ---------------------------------------------------------------------------------------------------------

usethis::use_pkgdown_github_pages()
file.rename(".github/workflows/pkgdown.yaml", ".github/workflows/pkgdown.yml")
usethis::use_badge("pkgdown", "https://github.com/jimbrig/rdev/actions/workflows/pkgdown.yml", "https://github.com/jimbrig/rdev/actions/workflows/pkgdown.yml/badge.svg")

usethis::use_directory("pkgdown", ignore = TRUE)
fs::file_move("_pkgdown.yml", "pkgdown/_pkgdown.yml")
source("dev/scripts/pkg_logo.R")
pkgdown::build_favicons()

# fragments -------------------------------------------------------------------------------------------------------

fs::dir_create("man/fragments")
