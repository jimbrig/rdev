
#  ------------------------------------------------------------------------
#
# Title : R Version Utilities
#    By : Jimmy Briggs
#  Date : 2026-09-14
#
#  ------------------------------------------------------------------------

# download redirect URL to latest windows binary release
# https://cloud.r-project.org/bin/windows/base/release.html

#

rver_remote <- function(url = "https://cloud.r-project.org/bin/windows/base/") {
  rlang::try_fetch({

  })
}

.rver_urls <- c(
  "api" = "https://api.r-hub.io/rversions/",
  "stable" = "https://cloud.r-project.org/bin/windows/base/",
  "devel" = "https://cloud.r-project.org/bin/windows/base/rdevel.html",
  "patched" = "https://cloud.r-project.org/bin/windows/base/rpatched.html"
)
