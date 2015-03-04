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

source("GetCleanData.R")

#Get the data
data <- getCleanData()

# Check if dir exists, if not create
if (! file.exists("./myplots")) {
    dir.create("./myplots")
}

# Do the plot bit
plot1(data, "./myplots/plot1.png")
