library(stringr)
library(dplyr)

rm(list=ls())

#전체 변환 이름 불러오기
subm_name <- read.csv("F:/2021_이름변경_압축파일/task 4/익명화-병리번호리스트.csv",
                      stringsAsFactors = T,
                      na.strings = NA,
                      header = T)
#과제제출번호만 리스트화
pick_name_list <- as.matrix(subm_name$병리번호)

#변경할 파일리스트 불러오기
file_change <- read.csv("F:/2021_이름변경_압축파일/task 4/익명화해제 파일 리스트.csv",
                        stringsAsFactors = T,
                        na.strings = NA,
                        header = T)

lnc_change <-length(file_change$폴더명)



for (i in 1:lnc_change) {
  original_name <- as.matrix(file_change$파일명)[i]
  original_name <- gsub(".svs","",original_name) 
  original_name <- substr(original_name,1,13)
  pick_name_num <- grep(original_name,subm_name$익명번호)
  
  
  if (length(pick_name_num)>0){
    new_name <- pick_name_list[pick_name_num]
    
  } else {
    print("검색되지않음")
    new_name <- "해당없음"
  }
  
  file_change$변경.후.파일명[i] <- new_name

}

write.csv(file_change, "F:/2021_이름변경_압축파일/task 4/익명화해제 파일 리스트_2.csv", row.names=FALSE)


