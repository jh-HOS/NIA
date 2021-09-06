rm(list=ls()) #현재 저장된 Data나 value 모두 삭제하기.

library(stringr)
library(dplyr)
setwd("")

src_dir <- c('C://python/test/0802')
src_file <- list.files(src_dir, pattern = ".xml")   #불러올 파일들 리스트화
src_file_lnc <- length(src_file)

file_change <- read.csv("C://python/210906_이름변경.csv",
         stringsAsFactors = T,
         na.strings = NA,
         header = T) #csv로 읽어오기


for (i in 1){
  print(paste("번호 : ",i))
  matched_name <- gsub(".xml","",src_file[i])
  print(paste("파일이름 : ", matched_name))
  
  matching <- grep(matched_name,file_change$name)
  matching <- as.matrix(matching)
  target.location <- matching[1,1]
  
  loading_name <- file_change$for.chage[target.location]
  loading_name <- as.character(loading_name)
  print(loading_name)
  
  setwd(src_dir)
  change_name <- paste0(src_dir,"/",loading_name,".xml")
  file.rename(src_file[i], change_name)
}
