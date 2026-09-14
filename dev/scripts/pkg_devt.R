
#  ------------------------------------------------------------------------
#
# Title : Package Development Script
#    By : Jimmy Briggs
#  Date : 2026-09-14
#
#  ------------------------------------------------------------------------

usethis::use_package_doc()
usethis::use_import_from("rlang", ".data")
usethis::use_import_from("rlang", ".env")

c("aaa", "zzz") |> purrr::walk(usethis::use_r, open = FALSE)

usethis::use_r("utils_pkg")
usethis::use_r("utils_config")
usethis::use_r("utils_system")
usethis::use_r("utils_paths")
usethis::use_r("utils_checks")
usethis::use_r("utils_cmd")
usethis::use_r("utils_rver")
usethis::use_r("utils_cli")
