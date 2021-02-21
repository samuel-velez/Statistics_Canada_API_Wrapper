library(httr)
library(jsonlite)
library(dplyr)
library(purrr)
library(docstring)

check_internet <- function(){
  stop_if_not(.x = has_internet(), msg = "Please check your internet connexion")
}

#' @importFrom httr status_code
check_status <- function(res){
  stop_if_not(.x = has_internet(), msg = "Please check your internet connexion")
  stop_if_not(.x = status_code(res), 
              .p = ~ .x == 200,
              msg = "The API returned an error")
}

#Download full dataset

download_csv <- function(Status = NULL, productId = NULL)
{
  args <- list(Status = Status, productId = productId)
  #Product Id (PID)
  #The unique 8 digit product identifier for the table.
  #' Statistics Canada Full Database Downloader
  #' 
  #' This function allows you to download the desired table from Stat Canada website in a CSV format#'
  #' The required arguments is productId, which is the unique 8 digit product identifier for the table.
  #'
  #' @param productId: which is the unique 8 digit product identifier for the table on statCanada website
  #' @examples
  #' download_csv("14100287")
  #' "status": "SUCCESS",
  #' "object": "https://www150.statcan.gc.ca/n1/tbl/csv/14100287-eng.zip"
  productId <- "14100287"
  string1 <- "https://www150.statcan.gc.ca/t1/wds/rest/getFullTableDownloadCSV/" # first string 
  string2 <- productId # second string. 
  string3 <- "/en"
  S <- paste(string1, string2, string3, sep ="") 
  url = "https://www150.statcan.gc.ca/t1/wds/rest/getBulkVectorDataByRange"
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Check for internet
  # Create the 
  doc1 <- GET(url, query = compact(args))
  # Check the result
  check_status(doc1)
  # Get the content and return it as a data.frame
  fromJSON(rawToChar(res$content))$features
}
?download_csv

#Download specific data ranges

statcan_daterange<-function(vectors, start_time, end_time=Sys.time(), use_ref_date=TRUE){
  #' Statistics Canada data by Date Ranges
  #'
  #' This function brings the specified vector's time series for the specified date ranges, with the end time being the current date and time by default.
  #' 
  #' The three required arguments are the VectorID, Start date and End date.
  #' 
  #' @param vectors Vectors from the Statistics Canada Website. Further details in the main documentation.
  #' @param start_time Start period for the time series in format "YYYY:MM:DD"
  #' @param end_time End period for the time series in format "YYYY:MM:DD". Default is the system's current time.
  #'
  #' @examples
  #' statcan_daterange("v1", "2019-01-01", "2021-02-18")
  #' statcan_daterange("v41690973", "2019-01-01")
  url = "https://www150.statcan.gc.ca/t1/wds/rest/getBulkVectorDataByRange"
  start_date = paste0(start_time,"T00:00")
  end_date = paste0(end_time,"T00:00")
  
  vectors=gsub("^v","",vectors)
  vectors_string=paste0('"vectorIds":[',paste(map(as.character(vectors),function(x)paste0('"',x,'"')),collapse = ", "),"]")
  time_string=paste0('"startDataPointReleaseDate": "',start_date,
                     '","endDataPointReleaseDate": "',end_date,'"')
  body=paste0("{",vectors_string,",",time_string,"}")
  
  r <- POST(url, body=body, encode = "json", timeout(200), add_headers("Content-Type"="application/json"))
  result <- content(r, as = "text", encoding = "UTF-8")
  df <- fromJSON(result, flatten = TRUE)
  df <- df$object.vectorDataPoint[[1]][c("refPer","value")]
}