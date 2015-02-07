library(dplyr)

#Load the raw dataset converting "?" to NA
rawDataset  <- read.csv("household_power_consumption.txt",header=TRUE,blank.lines.skip=TRUE,skipNul=TRUE,sep = ";",na.strings = "?")

#Create a Date and Time into a date/time class
rawDataset$data_time <- strptime(paste(rawDataset$Date, rawDataset$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#Select the relevant subsets 2007-02-01 and 2007-02-02
dataSet <- subset.data.frame(rawDataset, Date %in%  c("1/2/2007","2/2/2007"))

#Generate the plot
hist(dataSet$Global_active_power,
     main="Global Active Power",
     col="Red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()