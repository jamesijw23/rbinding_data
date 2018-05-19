library(dplyr)
library(sqldf)
library(readxl)

## The folder must only contain files that are what you want to combine
imp_files = list.files()[grep(".xlsx",list.files())]
## You automatically should know the number of columns that you 
## want the final dataframe to have







##-------------------------------------------

####
## Function
## Input 1: List of files that should be into dataframe 
## Input 2: Number of columns of final dataframe
## Output 1: Combined dataframe
## Output 2: Result of adding dataframe
####


## Empty dfs for output
final_df = data.frame(id=numeric(),
                      password=character(),
                      interaction=character())

result_df = data.frame(df_name=character(),
                       result=character())





######-----------------------------------------
## a) Read in ith file
######-----------------------------------------
data_tmp = read_excel(imp_files[1])

######-----------------------------------------
## b) Check Dimensions of new dataframes
######-----------------------------------------
(dim_0227 = dim(data_20170227))

######-----------------------------------------
## c) Check if columns are the same
######-----------------------------------------
(check_31 = identical(colnames(data_20170227),
                      colnames(data_until_0213)[-34]))

######-----------------------------------------
## d) Add column based on date to both data sets
######-----------------------------------------
data_20170227$date = rep('02-27-2017',nrow(data_20170227))

######-----------------------------------------
## e) Check if columns are the same
######-----------------------------------------
(check_32 = identical(colnames(data_20170227),colnames(data_until_0213)))


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


