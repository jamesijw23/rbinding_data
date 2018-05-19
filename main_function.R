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


result_df = vector()





for(iter_num in 1:length(imp_files)){
  
  if(iter_num == 1){
    ######-----------------------------------------
    ## a) Read in ith file
    ######-----------------------------------------
    final_df = read_excel(imp_files[iter_num])
    ######-----------------------------------------
    ## b) Add column based on date to both data sets
    ######-----------------------------------------
    final_df$imp_var = rep(iter_num,nrow(final_df))
    
    result_df[iter_num,1] = imp_files[iter_num]
    tmp_result = c(imp_files[iter_num],'Success')
    
  } else {
    
    ######-----------------------------------------
    ## a) Upload df
    ######-----------------------------------------  
    data_tmp = read_excel(imp_files[iter_num])
    
    
    ######-----------------------------------------
    ## b) Check Dimensions of new dataframes
    ######-----------------------------------------
    col_number_check = ncol(data_tmp) == ncol(final_df)
    
    ######-----------------------------------------
    ## c) Check if columns are the same after first df
    ######-----------------------------------------
    col_name_check = identical(colnames(data_tmp),
                               colnames(final_df)[-nrow(final_df)])
    ######-----------------------------------------
    ## d) Add column based on date to both data sets
    ######-----------------------------------------
    data_tmp$imp_var = rep(iter_num,nrow(data_tmp))
  }
  
  
  ######-----------------------------------------
  ## f) Add new dataframe to overall dataframe
  ## Checks to determine if dfs are right to be combined
  ## If not a message states why
  ######-----------------------------------------
  if(iter_num > 1 &  col_name_check == T & col_number_check == T){
    final_df = rbind(final_df,data_tmp)
    tmp_result <- c(imp_files[iter_num],'Success')
  } else if (iter_num > 1 &  col_name_check == F & col_number_check == T){
    tmp_result <- c(imp_files[iter_num],'Wrong Column Names')
    
  } else if (iter_num > 1 &  col_name_check == T & col_number_check == F){
    tmp_result <- c(imp_files[iter_num],'Wrong # of Columns')
  } else {
    tmp_result <- c(imp_files[iter_num],'Wrong # of Columns and Wrong Column Names')
  }
  result_df = rbind(result_df,tmp_result)
}


