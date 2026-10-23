#* README:
#* This script transforms all .jpg and .NEF files in the directory "
#* research_raw_gitignore" into smaller, lighter .jpg files that are saved into
#* "research" for the web to load faster.

library(magick)

files <- list.files("images/research_raw_gitignore",
                    pattern = "\\.(jpg|jpeg|png|nef)$",
                    full.names = TRUE, ignore.case = TRUE)

for (f in files) {
  out <- file.path("images/research",
                   paste0(tools::file_path_sans_ext(basename(f)), ".jpg"))
  image_read(f) |>
    image_orient() |>                       # fixes rotation from camera EXIF
    image_resize("1200x1200>") |>           # only shrinks, keeps aspect ratio
    image_write(out, format = "jpeg", quality = 80)
}