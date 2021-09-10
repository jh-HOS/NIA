library(stringr)
library(dplyr)

rm(list=ls())

src_dir <- "F:/2021_제출용/task 5/15_01"

for (i in 1:227){
  basic_name <- "15_01_"
  id_number <- sprintf("%04d",i)
  new_dir <- paste0(src_dir,"/",basic_name,id_number)
  print(new_dir)
  dir.create(new_dir)
}
