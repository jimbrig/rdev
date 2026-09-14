
#  ------------------------------------------------------------------------
#
# Title : Package Logo
#    By : Jimmy Briggs
#  Date : 2026-07-11
#
#  ------------------------------------------------------------------------

man_figures_path <- file.path(this.path::this.proj(), "man/figures")
if (!dir.exists(man_figures_path)) dir.create(man_figures_path)


# remote image ------------------------------------------------------------

# img_url <- "https://static.thenounproject.com/png/962492-200.png"
# curl::curl_download(img_url, destfile = file.path(man_figures_path, "dev.png"))

# create composite logo -------------------------------------------------------------------------------------------

# local({
#   dev_img <- magick::image_read("man/figures/dev.png")
#   r_img   <- magick::image_read_svg("man/figures/R.svg") |> magick::image_scale("65")
#   dev_img_info <- magick::image_info(dev_img)
#   r_img_info   <- magick::image_info(r_img)
#   target_cx <- dev_img_info$width  * 0.50   # ~100
#   target_cy <- dev_img_info$height * 0.30   # was 0.275 (~55) -> now ~64
#   x_off <- target_cx - r_img_info$width  / 2
#   y_off <- target_cy - r_img_info$height / 2
#   combined_img <- magick::image_composite(dev_img, r_img, offset = magick::geometry_point(x_off, y_off))
#   magick::image_write(combined_img, "man/figures/rdev.png")
# })

# # setup hex logo --------------------------------------------------------------------------------------------------
#
# hex_img <- "man/figures/rdev.png"
# sysfonts::font_add_google("Ubuntu", "ubuntu")
# showtext::showtext_auto()
#
# # svg ---------------------------------------------------------------------
#
# hexSticker::sticker(
#   filename = "man/figures/hex.logo.svg",
#   # package name
#   package = pkgload::pkg_name(),
#   p_x = 1,
#   p_y = 1.4,
#   p_color = "white",
#   p_family = "ubuntu",
#   p_fontface = "plain",
#   p_size = 6,
#   # image
#   subplot = hex_img,
#   s_x = 1,
#   s_y = 0.8,
#   s_width = 0.5,
#   s_height = 1,
#   asp = 0.9,
#   dpi = 600,
#   # hexagon
#   h_size = 1.2,
#   h_fill = "black",
#   h_color = "cyan",
#   # url
#   url = "github.com/jimbrig/rdev",
#   u_x = 1,
#   u_y = 0.08,
#   u_color = "cyan",
#   u_family = "ubuntu",
#   u_size = 1.2,
#   u_angle = 30
# )
#
# # png ---------------------------------------------------------------------
#
# hexSticker::sticker(
#   filename = "man/figures/hex.logo.png",
#   # package name
#   package = pkgload::pkg_name(),
#   p_x = 1,
#   p_y = 1.4,
#   p_color = "white",
#   p_family = "ubuntu",
#   p_fontface = "plain",
#   p_size = 10,
#   # image
#   subplot = hex_img,
#   s_x = 1,
#   s_y = 0.8,
#   s_width = 0.5,
#   s_height = 1,
#   asp = 0.9,
#   dpi = 600,
#   # hexagon
#   h_size = 1.2,
#   h_fill = "black",
#   h_color = "cyan",
#   # url
#   url = "github.com/jimbrig/shinypkg",
#   u_x = 1,
#   u_y = 0.08,
#   u_color = "cyan",
#   # u_family = "ubuntu",
#   u_size = 1.2,
#   u_angle = 30
# )


# set package logo ------------------------------------------------------------------------------------------------

# usethis::use_logo("man/figures/hex.logo.png")

usethis::use_logo("man/figures/hex-rdev.png")

