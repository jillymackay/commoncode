# Quickly read JISC Online Survey files


# Don't edit the file name


# Always reads last (i.e. most recent) filename


read_jisc <- function(path) {
  files <- list.files(pattern = "*.xlsx")
  list <- stringr::str_subset(files, "results-for")
  readxl::read_excel(tail(list,1))
}


dat <- read_jisc()
