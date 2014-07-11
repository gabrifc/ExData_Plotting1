## File: plot3.R, a function for the 1st Course Project of the Exploratory analysis course 
## Web: https://class.coursera.org/exdata-004/
## Authors: rdpeng, gabrielfc
## Date: 2014/07
## Description: This R script has 1 function: Reconstruct a given plot ('plot3.png') in the course.
## Important: The axes on the plot are on Spanish because that's my OS language.

## Set the Working directory on the root of the repo.
setwd("~/Random/Exploratory Analysis Course/Project 1")

## Import the downloaded file into R.
power_consumption_data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

## Subset on the 2 days we are working
working_data <- subset(power_consumption_data, (power_consumption_data$Date == "1/2/2007" | power_consumption_data$Date== "2/2/2007")) 

## For this plot to work, R has to understand that the strings are Dates and Hours.
## We start creating a new column with the combination of the strings.
working_data$FormattedTime <- paste(working_data$Date,working_data$Time)

## And now we specify the input format to strptime to convert them.
## Time is already well formatted, but we have to modify the formatting of the Dates.
working_data$FormattedTime <- strptime(working_data$FormattedTime, "%d/%m/%Y %H:%M:%S")

## Recreate the plot
## Iniatialize png export
png(filename="plot3.png", width=480, height=480)

## We have to plot 3 different lines, Sub_metering_1, 2 and 3.
## Start with the first in black.
plot(working_data$FormattedTime, working_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

## Add the second in red and the third in blue.
lines(working_data$FormattedTime, working_data$Sub_metering_2, type = "l", col = "red")
lines(working_data$FormattedTime, working_data$Sub_metering_3, type = "l", col = "blue")

## Finally, the legend on the top right.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

## Finish the export
dev.off()