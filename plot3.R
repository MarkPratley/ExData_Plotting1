# Coursera exdata-012
#   Mark Pratley
#     Assignment #1
#       Plot#3
#        04-Mar-2015

# Outputs 3 x submetering line graphs of 'data' into 'file'
plot3 <- function(data, file) {
    
    # Create  png with filename 'file'
    png(filename = file, width = 480, height=480)

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
           lty=c(1,1,1))
    
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
plot3(data, "./myplots/plot3.png")
