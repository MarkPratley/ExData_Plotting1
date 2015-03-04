# Coursera exdata-012
#   Mark Pratley
#     Assignment #1
#       Plot#2
#        04-Mar-2015

plot2 <- function(data, file) {
    
    # Create  png with filename file
    png(filename = file, width = 480, height=480)

    # line plot of gap over time
    plot(df$Timestamp, df$GAP,
         type = "l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)" )
    
    # Close graphics device
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
plot2(data, "./myplots/plot2.png")


