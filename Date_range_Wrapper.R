library(httr)
library(jsonlite)
library(dplyr)
library(purrr)

#Date need a specific format: "YYYY-MM-DD". End time is current time by default
#Vectors can be checked out using a site

statcan_daterange<-function(vectors, start_time, end_time=Sys.time(), use_ref_date=TRUE){
  url = "https://www150.statcan.gc.ca/t1/wds/rest/getBulkVectorDataByRange"
  start_date = paste0(start_time,"T00:00")
  end_date = paste0(end_time,"T00:00")
  vectors = c("v41690973")
  
  vectors=gsub("^v","",vectors)
  vectors_string=paste0('"vectorIds":[',paste(map(as.character(vectors),function(x)paste0('"',x,'"')),collapse = ", "),"]")
  time_string=paste0('"startDataPointReleaseDate": "',start_release_date,
                     '","endDataPointReleaseDate": "',end_release_date,'"')
  body=paste0("{",vectors_string,",",time_string,"}")
  
  r <- POST(url, body=body, encode = "json", timeout(200), add_headers("Content-Type"="application/json"))
  result <- content(result, as = "text", encoding = "UTF-8")
  df <- fromJSON(result,flatten = TRUE)
  df
  }

df <- statcan_daterange("v41690973", "2015-01-01", "2021-02-18")
