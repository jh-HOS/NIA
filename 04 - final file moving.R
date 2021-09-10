library(stringr)
library(dplyr)
library(filesstrings)

rm(list=ls())

src_dir <- "F:/2021_이름변경_xml/task5 검수완료 파일" #옮길 파일들의 현재 위치
src_file <- list.files(src_dir, pattern = ".xml")
src_file_lnc <- length(src_file)

chg_dir <- "F:/2021_제출용/task 5/15_01"


for (i in 1:src_file_lnc) {
  print(i)
  print(src_file[i])
  id_file <- strsplit(src_file[i],"_") #고유 번호 추출
  
  folder_name <- paste0(id_file[[1]][1],"_",id_file[[1]][2],"_",id_file[[1]][3])
  is_folder <- paste0(chg_dir,"/",folder_name) #맞는 폴더 이름
  
  print(dir.exists(is_folder))
  is_result <- dir.exists(is_folder)
  
  if ( is_result == TRUE){
    is_folder <- is_folder
  } else {
    is_folder <- src_dir
  }
  print(is_folder)
  setwd(src_dir)
  file.move(src_file[i],is_folder)

}






