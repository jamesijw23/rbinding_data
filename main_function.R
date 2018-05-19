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
## Input 2: Number of columns of final dataframe
## Input 3: Columns are already known
## Output 1: Combined dataframe
## Output 2: Result of adding dataframe
####


result_df = data.frame(df_name=character(),
                       result=character())








iter_num = 1

######-----------------------------------------
## a) Read in ith file
######-----------------------------------------
data_tmp = read_excel(imp_files[iter_num])

######-----------------------------------------
## b) Check Dimensions of new dataframes
######-----------------------------------------
col_num_check = ncol(data_tmp) == number_columns


######-----------------------------------------
## ***  c) Check if columns are the same after first df
######-----------------------------------------

if(not first df)
  col_name_check = identical(colnames(data_tmp),
                      colnames(final_df)[-nrow(final_df)])







######-----------------------------------------
## d) Add column based on date to both data sets
######-----------------------------------------
data_tmp$imp_var = rep(iter_num,nrow(data_tmp))



######-----------------------------------------
## f) Add new dataframe to overall dataframe
######-----------------------------------------
data_until_0227 = rbind(data_until_0213,data_20170227)


######-----------------------------------------
## g) Check Dimensions of new dataframe 
######-----------------------------------------
dim(data_until_0227)[1]
dim(data_until_0213)[1] + dim_0227[1]
##--------------------------------------------


