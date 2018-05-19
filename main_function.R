library(dplyr)
library(sqldf)
library(readxl)

## The folder must only contain files that are what you want to combine
imp_files = list.files()[grep(".xlsx",list.files())]


## Will have to change column that represents file

##-------------------------------------------

####
## Function
## Input 1: List of files that should be into dataframe 
## Output 1: Combined dataframe
## Output 2: Result of adding dataframe
####

combine_file(imp_files){
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
    
    ## c) Add result
    tmp_result = c(imp_files[iter_num],'Success')
    
    col_name_check = T; col_number_check = T
    
  } else {
    
    ######-----------------------------------------
    ## a) Upload df
    ######-----------------------------------------  
    data_tmp = read_excel(imp_files[iter_num])
    
    
    ######-----------------------------------------
    ## b) Check Dimensions of new dataframes
    ######-----------------------------------------
    col_number_check = ncol(data_tmp) == (ncol(final_df) -1)
    
    ######-----------------------------------------
    ## c) Check if columns are the same after first df
    ######-----------------------------------------
    col_name_check = identical(colnames(data_tmp),
                               colnames(final_df)[-ncol(final_df)])
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
  } else if(iter_num >1){
    tmp_result <- c(imp_files[iter_num],'Wrong # of Columns and Wrong Column Names')
  }
  result_df = rbind(result_df,tmp_result)
}
return(list(f_df = final_df,status = result_df))
}
