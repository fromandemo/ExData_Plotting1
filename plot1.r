# Generates the path for the download
filePath <- function(...) { paste(..., sep = "/") }

# Downloads the file
downloadData <- function() {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dir.create("data",showWarnings = FALSE)
  zipFile <- filePath("data", "dataset.zip")
  
  if(!file.exists(zipFile)) { 
    download.file(url, zipFile, method = "curl") 
    unzip(zipFile, exdir = "data") 
  }
}

downloadData()
data<-read.csv("data/household_power_consumption.txt",sep =";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")

df2<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
