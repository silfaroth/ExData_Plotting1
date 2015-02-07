library(dplyr)

#Load the raw dataset converting "?" to NA
rawDataset  <- read.csv("household_power_consumption.txt",header=TRUE,blank.lines.skip=TRUE,skipNul=TRUE,sep = ";",na.strings = "?")

#Create a Date and Time into a date/time class
rawDataset$data_time <- strptime(paste(rawDataset$Date, rawDataset$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#Select the relevant subsets 2007-02-01 and 2007-02-02
dataSet <- subset.data.frame(rawDataset, Date %in%  c("1/2/2007","2/2/2007"))

#Generate the plot

png("plot3.png",width=480,height=480)
plot(dataSet$data_time,dataSet$Sub_metering_1,pch="",
     xlab="",
     ylab="Energy sub metering")
lines(dataSet$data_time,dataSet$Sub_metering_1)
lines(dataSet$data_time,dataSet$Sub_metering_2,col="Red")
lines(dataSet$data_time,dataSet$Sub_metering_3,col="Blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),
       col=c("Black","Red","Blue"))

dev.off()



