# Project 1 Plot 1
# Set working directory to access data from subdirectory data/

# Use system commands on Mac to preprocess file so that only a subset with the
# required dates is read by R. The following adapts method posted to the 
# Discussion Forums by Alexander Vikulin

# Read first from the file and writes it to hpc.txt
system("head -n 1 data/household_power_consumption.txt >data/hepc.txt")
# take lines that start with 1/2/2007 or 2/2/2007 and append them to hepc.txt
system("grep '^[12]/2/2007' data/household_power_consumption.txt >>data/hepc.txt")
# Reads hepc.txt file into data frame called mydata
hepc <- read.csv("data/hepc.txt", sep = ";", header = T, na.strings = '?')

# Create Plot 1 using hist function
png(file="plot1.png",width=480,height=480)
with(hepc,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))
dev.off()
