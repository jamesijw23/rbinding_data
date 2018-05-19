library(dplyr)
library(sqldf)
library(readxl)

## The folder must only contain files that are what you want to combine
imp_files = list.files()[grep(".xlsx",list.files())]

## You automatically should know the number of columns that you 
## want the final dataframe to have
number_columns = 3

## Column Names need to be known before hand
## This can be committed to be used by reading 1 file and observe
c_names = c('id','password','interaction')


## Will have to change column that represents file

##-------------------------------------------

####
## Function
## Input 1: List of files that should be into dataframe 
## Output 1: Combined dataframe
## Output 2: Result of adding dataframe
####


result_df = data.frame(df_name=character(),
                       result=character())







if(iter_num == 1){
  ######-----------------------------------------
  ## a) Read in ith file
  ######-----------------------------------------
  final_df = read_excel(imp_files[iter_num])

} else {
  
  ######-----------------------------------------
  ## b) Check Dimensions of new dataframes
  ######-----------------------------------------
  col_num_check = ncol(data_tmp) == ncol(final_df)
  
  data_tmp = read_excel(imp_files[iter_num])
  ######-----------------------------------------
  ## ***  c) Check if columns are the same after first df
  ######-----------------------------------------
  col_name_check = identical(colnames(data_tmp),
                             colnames(final_df)[-nrow(final_df)])
}

######-----------------------------------------
## d) Add column based on date to both data sets
######-----------------------------------------
data_tmp$imp_var = rep(iter_num,nrow(data_tmp))

######-----------------------------------------
## f) Add new dataframe to overall dataframe
######-----------------------------------------
final_df = rbind(data_until_0213,data_tmp)




