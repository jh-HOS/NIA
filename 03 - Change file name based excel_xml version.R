rm(list=ls())

library(stringr)
library(dplyr)

src_dir <- c('F:/2021_이름변경_xml/task5 검수완료 파일') #파일위치
src_file <- list.files(src_dir, pattern = ".xml")
src_file_lnc <- length(src_file)

name_ref <- read.csv("F:/2021_이름변경_xml/task5 xml_2.csv",
                     stringsAsFactors = T,
                     na.strings = NA,
                     header = T) 

name_ref_list <- as.matrix(name_ref$변경.후.파일명)

for (i in 1:src_file_lnc){
  print(i)
  file_names <- src_file[i]
  print(file_names)
  pick_name_num <- grep(file_names,name_ref$파일명)
  
  if (length(pick_name_num) == 1){
    new_name <- name_ref_list[pick_name_num]
  } else {
    print("얘 이상")
    new_name <- file_names
  }
  print(new_name)
  
  setwd(src_dir)
  file.rename(file_names, new_name)
  
  
}

