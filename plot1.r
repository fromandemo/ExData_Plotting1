# Generates the path for the download
filePath <- function(...) { paste(..., sep = "/") }

# Downloads the file
downloadData <- function() {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dir.create("data",showWarnings = FALSE)
  zipFile <- filePath("data", "dataset.zip")
  
  if(!file.exists(zipFile)) { 
    download.file(url, zipFile, method = "curl") 
  }
  unzip(zipFile, exdir = "data")   
}


