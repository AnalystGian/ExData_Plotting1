# Setting my working directory
getwd()
setwd("D:/DATA ANALYSTS/R/R Course Directory")

# Install and load relevant packages
install.packages("tidyverse")
library(tidyverse)

# Read txt file
hpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# Convert the classes of Date and Time variables
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),
                                 format = "%Y-%m-%d %H:%M:%S")

# Filter the data from "2007-02-01" to "2007-02-02"
hpc <- hpc[hpc$Date >= "2007-2-1" & hpc$Date <= "2007-2-2",]

# Change the classes of other remaining columns
hpc[,3] <- as.numeric(hpc[,3])
hpc[,4] <- as.numeric(hpc[,4])
hpc[,5] <- as.numeric(hpc[,5])
hpc[,6] <- as.numeric(hpc[,6])
hpc[,7] <- as.numeric(hpc[,7])
hpc[,8] <- as.numeric(hpc[,8])

# Creating Plot1
with(hpc, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
                       col = "red", main = "Global Active Power"))

# Save plot1 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot1.png")