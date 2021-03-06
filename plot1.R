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

#Read and transform
data<-read.csv("data/household_power_consumption.txt",sep =";")
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <-as.Date(data$Date,"%d/%m/%Y")

# Filter data
data_subset<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

# Convert to numeric
for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}

# Open device
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

# Asign margins
par(mar = c(6, 6, 6, 6))

#Generates histogram
hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# Close device and save file
dev.off()
