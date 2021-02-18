R package wrapping a RESTful API for the Statistics Canada Web Data Service (API) (https://www.statcan.gc.ca)

## Description

Statistics Canada is Canada’s national statistical office. The agency ensures Canadians have the key information on Canada's economy, society and environment that they require to function effectively as citizens and decision makers.

Statistics Canada Web Data Service is an API service, which will provide access to data and metadata released by Statistics Canada each business day. This web service provides an access to the main Statistics Canada output database via a number of "calls" or "methods" that harvest the data and metadata in its raw form and return it to the caller.

`our-package` allows one to extract data for a given date range using vectors and extract the entire time series for selected tables in CSV output format.

See https://www.statcan.gc.ca/eng/developers/wds for API docs for the Statistics Canada Web Data service (API).

Please read the Web Data Service User Guide ( https://www.statcan.gc.ca/eng/developers/wds ).


## Installation

From CRAN


```r
install.packages(“our-package”)
```

? Or the development version from Github 


```r
remotes::install_github(“our-repository/our-package“)
```

Load package


```r
library(“our”-package)
```



## getBulkVectorDataByRange


```r
example = getBulkVectorDataByRange(vectorIds=["74804”,”1”], startDataPointReleaseDate=“2015-12-01T08:30”, endDataPointReleaseDate=“2018-03-31T19:00”)
example
```


### inspect output


```r
pending
```
You will note that the function returns a vector. This means that you can interrogate the vector as per usual. This provides access to large datasets of high quality which to build and integrate.

## getFullTableDownloadCSV


```r
example = getFullTableDownloadCSV(14100287)
```


### inspect output


```r
pending
{
  "status": "SUCCESS",
  "object": "https://www150.statcan.gc.ca/n1/tbl/csv/14100287-eng.zip"
}
```
This specific request downloads the entire table.

## IDs for products
You can find IDs for products by coordinating them with CANSIM numbers you come across on the StatsCan website.
A full mapping from CANSIM numbers to IDs is available at: https://www.statcan.gc.ca/eng/developers/concordance

## Contributors
Mandar Kathe @Mandar_Kat\
Samuel Velez @samuel-velez\
Vicens Paneque @VicensPaneque

## Meta

* ?Please [report any issues or bugs](https://https://github.com/samuel-velez/Statistics_Canada_API_Wrapper/issues).
* ?License: MIT
* ?Get citation information for `our-package` in R doing `citation(package = ‘our-package’)`
* ?Please note that this project is released with a [Contributor Code of Conduct][coc]. By participating in this project you agree to abide by its terms.
