# Coursera exdata-012
#   Mark Pratley
#     Assignment #1
#       Clean Data
#        01-Mar-2015

# Loads relevant .txt rows
#  Cleans and formats data
#  Returns data.frame
getCleanData <- function() {

    df = read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", na.strings="?")
    
    df$V1 <- as.character(df$V1)
    df$V2 <- as.character(df$V2)
    
    names(df) <- c("Date", "Time", "GAP", "GRP", "Voltage", "GIntensity", "Sub1", "Sub2", "Sub3")
    
    # Create Datetime from Date & Time
    df$Date <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
    
    names(df)[1] <- "Timestamp"
    ## df$Timestamp <- as.Date(df$Timestamp, "%d/%m/%Y %H:%M:%S")
    
    # Remove Time now we have Datetime
    df <- df[,c(-2)]
    
    df
}
    
