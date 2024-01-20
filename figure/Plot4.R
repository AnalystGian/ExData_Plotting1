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

#Constructing Plot4
par(mfrow = c(2,2))
#Plot at topleft
with(hpc, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(hpc$DateTime[1]),
                      as.numeric(hpc$DateTime[1441]),
                      as.numeric(hpc$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at topright
with(hpc, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
                       xaxt = "n"))
axis(side = 1, at = c(as.numeric(hpc$DateTime[1]),
                      as.numeric(hpc$DateTime[1441]),
                      as.numeric(hpc$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at bottomleft
with(hpc, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(hpc$DateTime[1]),
                      as.numeric(hpc$DateTime[1441]),
                      as.numeric(hpc$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(hpc, lines(DateTime, Sub_metering_1))
with(hpc, lines(DateTime, Sub_metering_2, col = "red"))
with(hpc, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot at bottomright
with(hpc, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", 
                       ylab = "Global_reactive_power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(hpc$DateTime[1]),
                      as.numeric(hpc$DateTime[1441]),
                      as.numeric(hpc$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Save Plot4
dev.copy(device = png, width = 480, height = 480, file = "Plot4.png")