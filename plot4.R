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
    plot(df$Timestamp, df$GAP,
         ylab = "Global Active Power",
         xlab="",
         type="l")
    
    # voltage vs timestamp
    plot(df$Timestamp, df$Voltage,
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
        points(df$Timestamp, df$Sub1, type="l")
        
        # Sub 2 - Red
        points(df$Timestamp, df$Sub2, type="l", col="red")
        
        # Sub 3 - Blue
        points(df$Timestamp, df$Sub3, type="l", col="blue")
        
        # Add legend
        legend("topright",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col=c("black", "red", "blue"),
               lty=c(1,1,1))
    
    # GRP Plot    
    plot(df$Timestamp, df$GRP,
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

