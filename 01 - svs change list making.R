library(stringr)
library(dplyr)

rm(list=ls())

file_change <- read.csv("F:/2021_file names in folder_backbone.csv",
                        stringsAsFactors = T,
                        na.strings = NA,
                        header = T) 

src_dir <- c('F:/2021_이름변경_압축파일/task 4/')
src_file <- list.files(src_dir, pattern = "_2.csv")
src_file_lnc <- length(src_file)



for (i in 1:src_file_lnc) {
  assign(paste0("files_",i), read.csv(paste0("F:/2021_이름변경_압축파일/task 4/",src_file[i]),
                                      stringsAsFactors = T,
                                      na.strings = NA,
                                      header = T) )
  
  total <- files_1
  if (i>1) {
    total <- bind_rows(total, get(paste0("files_",i)))
  }
}


