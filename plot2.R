## File: plot2.R, a function for the 1st Course Project of the Exploratory analysis course 
## Web: https://class.coursera.org/exdata-004/
## Authors: rdpeng, gabrielfc
## Date: 2014/07
## Description: This R script has 1 function: Reconstruct a given plot ('plot2.png') in the course.
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
png(filename="plot2.png", width=480, height=480)

## Create the plot with our new column, with lines and axe names.
plot(working_data$FormattedTime, working_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Finish the export
dev.off()