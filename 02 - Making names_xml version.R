library(stringr)
library(dplyr)

rm(list=ls())

#전체 변환 이름 불러오기
subm_name <- read.csv("F:/2021_제출용/task 5/svs_files_2.csv",
                      stringsAsFactors = T,
                      na.strings = NA,
                      header = T)
#과제제출번호만 리스트화
pick_name_list <- as.matrix(subm_name$변경.후.파일명)
#pick_trust <- as.matrix(subm_name$X)
#변경할 파일리스트 불러오기
file_change <- read.csv("F:/2021_이름변경_xml/task5 xml.csv",
                        stringsAsFactors = T,
                        na.strings = NA,
                        header = T,)

lnc_change <-length(file_change$폴더명)

for (i in 1:lnc_change) {
  print(i)
  file_names <- as.matrix(file_change$파일명)[i]
  file_id <- gsub(".xml",".svs",file_names)
  
  matched_name_number <- grep(file_id, subm_name$파일명)
  
  if ( length(matched_name_number)==1) {
    new_name <- pick_name_list[matched_name_number]
    
    
    new_xml_name <- gsub(".svs",".xml",new_name)
    
  } else {
    new_xml_name <- "매칭되는 번호 없음"
  }
  print(new_xml_name)
  file_change$변경.후.파일명[i] <- new_xml_name
  #file_change$폴더명[i] <- pick_trust[matched_name_number]
}

write.csv(file_change, "F:/2021_이름변경_xml/task5 xml_2.csv", row.names=FALSE)

