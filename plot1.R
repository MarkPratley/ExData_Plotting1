# Coursera exdata-012
#   Mark Pratley
#     Assignment #1
#       Plot#1
#        01-Mar-2015

# Outputs a hist into a png
plot1 <- function(data, file) {
    
    # Create  png with filename file
    png(filename = file, width = 480, height=480)
    
    # Create hist
    hist(data$GAP,
         main = "Global Active Power",
         col="red",
         xlab = "Global Active Power (kilowatts)" )

    # Close graphics device
    dev.off()
}

# Start plotting here

#Get the data
data <- getCleanData()

# Check if dir exists, if not create
if (! file.exists("./myplots")) {
    dir.create("./myplots")
}

# Do the plot bit
plot1(data, "./myplots/plot1.png")

##----------------------------------------
# Get and Clean the data functions

# magic url & files names
urlData <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipData <- "household_power_consumption.zip"
txtData <- "household_power_consumption.txt"

# Loads relevant .txt rows
#  Cleans and formats data
#  Returns data.frame
getCleanData <- function() {
    
    # Does the data file exists here? If not get it
    if (!file.exists(txtData))
        getFile()
    
    # Read in dataframe
    df = read.table(txtData,
                    skip=66637,
                    nrows=2880,
                    sep=";",
                    na.strings="?",
                    col.names=c("Timestamp", "Time", "GAP", "GRP", "Voltage",
                                "GIntensity", "Sub1", "Sub2", "Sub3"))
    
    # Create Datetime from Date & Time e.g. "1/2/2007 03:51:00"
    df$Timestamp <- strptime(paste(df$Timestamp, df$Time), format="%d/%m/%Y %H:%M:%S")
    
    # Remove Time col - now we just have a unified Timestamp (Datetime)
    df$Time <- NULL
    
    # Return
    df
}

# Downloads & Unzips data to working directory  - called if not already there
getFile <- function() {
    
    download.file(urlData, zipData, method="curl")
    unzip(zipData, txtData)
}