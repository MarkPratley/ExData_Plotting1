# Coursera exdata-012
#   Mark Pratley
#     Assignment #1
#       Clean Data
#        01-Mar-2015

# Loads relevant .txt rows
#  Cleans and formats data
#  Returns data.frame
getCleanData <- function() {
    
    df = read.table("household_power_consumption.txt",
                    skip=66637,
                    nrows=2880,
                    sep=";",
                    na.strings="?",
                    col.names=c("Timestamp", "Time", "GAP", "GRP", "Voltage", "GIntensity", "Sub1", "Sub2", "Sub3"))
    
    # Create Datetime from Date & Time
    df$Timestamp <- strptime(paste(df$Timestamp, df$Time), format="%d/%m/%Y %H:%M:%S")
    
    # Remove Time col - now we just have a unified Timestamp (Datetime)
    df$Time <- NULL
    
    df
}

