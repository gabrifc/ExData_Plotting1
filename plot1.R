## File: plot1.R, a function for the 1st Course Project of the Exploratory analysis course 
## Web: https://class.coursera.org/exdata-004/
## Authors: rdpeng, gabrielfc
## Date: 2014/07
## Description: This R script has 1 function: Reconstruct a given plot ('plot1.png') in the course.

## Set the Working directory on the root of the repo.
setwd("~/Random/Exploratory Analysis Course/Project 1")

## Import the downloaded file into R.
power_consumption_data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

## Subset on the 2 days we are working
working_data<- subset(power_consumption_data, (power_consumption_data$Date == "1/2/2007" | power_consumption_data$Date== "2/2/2007")) 

## Recreate the histogram
## Iniatialize png export
png(filename="plot1.png", width=480, height=480)

## Create the histogram
hist(working_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## Finish the export
dev.off()