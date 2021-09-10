library(stringr)
library(dplyr)

rm(list=ls())

#전체 변환 이름 불러오기
subm_name <- read.csv("F:/2021_제출용/task 5/task5_submission.csv",
                      stringsAsFactors = T,
                      na.strings = NA,
                      header = T)
#과제제출번호만 리스트화
pick_name_list <- as.matrix(subm_name$과제제출번호)

#변경할 파일리스트 불러오기
file_change <- read.csv("F:/2021_제출용/task 5/svs_files.csv",
                        stringsAsFactors = T,
                        na.strings = NA,
                        header = T,)

lnc_change <-length(file_change$폴더명)


for (i in 1:lnc_change) {
  print(i)
  original_name <- as.matrix(file_change$파일명)[i]
  original_name <- gsub(".svs","",original_name) 
  original_name <- substr(original_name,1,11)
  pick_name_num <- grep(original_name,subm_name$병리번호)
  pt_number_0 <- "0"
  
  if (length(pick_name_num)>0) {
    print(original_name)
    assign(paste0("pt_number_",i), pick_name_list[pick_name_num])
    now_pt_number <- get(paste0("pt_number_",i))
    
    if ( now_pt_number !=  get(paste0("pt_number_",i-1))) {
      new_name <- paste0(now_pt_number,"-HE1")
      j <- 1
    } else {
      j <- j + 1
      new_name <- paste0(now_pt_number,"-HE",j)
    }
  } else {
  
    print("매칭되는 제출넘버 없음")
  }
  print(paste0(new_name,".svs"))
  file_change$변경.후.파일명[i] <- paste0(new_name,".svs")

}

write.csv(file_change, "F:/2021_제출용/task 5/svs_files_2.csv", row.names=FALSE)

