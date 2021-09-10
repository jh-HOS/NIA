library(stringr)
library(dplyr)

rm(list=ls())

file_change <- read.csv("F:/2021_file names in folder_backbone.csv",
                        stringsAsFactors = T,
                        na.strings = NA,
                        header = T) 

src_dir <- c('F:/2021_이름변경_xml/task4 검수완료 파일/0901')
src_file <- list.files(src_dir, pattern = ".xml")
src_file_lnc <- length(src_file)


for (i in 1:src_file_lnc){
  print(src_file[i])
  file_change[i,2] <- src_file[i]
  
}

write.csv(file_change, "F:/2021_이름변경_xml/task4 검수완료 파일/0827_files.csv", row.names=FALSE)
