# Coursera exdata-012
#   Mark Pratley
#     Assignment #1
#       Plot#4
#        04-Mar-2015

# Create a 2x2 matrix of plots
#   GAP vs Time
#   Voltage vs Time
#   Submetering vs Time (3 plots + legend)
#   GRP vs time
plot4 <- function(data, file) {
    
    # Create  png with filename 'file'
    png(filename = file, width = 480, height=480)

    # Create a 2x2 matrix of plots
    par(mfrow=c(2,2))

    # GAP vs timestamp
    plot(data$Timestamp, data$GAP,
         ylab = "Global Active Power",
         xlab="",
         type="l")
    
    # voltage vs timestamp
    plot(data$Timestamp, data$Voltage,
         ylab = "Voltage",
         xlab="datetime",
         type="l")
    
    # Sub Meter Plots
    # Create an empty plot with labels
    plot(data$Timestamp, data$Sub1,
         type="n",
         xlab="",
         ylab="Energy sub metering")
    
        # Sub 1 - Black
        points(data$Timestamp, data$Sub1, type="l")
        
        # Sub 2 - Red
        points(data$Timestamp, data$Sub2, type="l", col="red")
        
        # Sub 3 - Blue
        points(data$Timestamp, data$Sub3, type="l", col="blue")
        
        # Add legend
        legend("topright",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col=c("black", "red", "blue"),
               lty=c(1,1,1),
               bty="n")     # No border on legend
    
    # GRP Plot    
    plot(data$Timestamp, data$GRP,
         ylab = "global_reactive_power",
         xlab="datetime",
         type="l")
    
    # Close
    dev.off()
}


# Start plotting here
source("GetCleanData.R")

#Get the data
data <- getCleanData()

# Check if dir exists, if not create
if (! file.exists("./myplots")) {
    dir.create("./myplots")
}

# Do the plot bit
plot4(data, "./myplots/plot4.png")

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