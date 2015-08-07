# Project 1 Plot 2
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

# Create datetime variable
x<-with(hepc,paste(Date,Time))
hepc$datetime<-strptime(x,"%d/%m/%Y %H:%M:%S")

# Create Plot 2

png(file="plot2.png",width=480,height=480)
with(hepc,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
