#plot1

#Read File

data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";")

# Subset it only with needed data

data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Create Variable Global_active_power
Global_active_power<-as.numeric(as.character(data$Global_active_power))

#Define Days
Days <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) 

#plots the data
SubMetering1<-as.numeric(as.character(data$Sub_metering_1))
SubMetering2<-as.numeric(as.character(data$Sub_metering_2))
SubMetering3<-as.numeric(as.character(data$Sub_metering_3))

plot(Days,SubMetering1, type="l", col="black", ylab="Energy Sub Metering")
 lines(Days,SubMetering2, type="l", col="red")
 lines(Days,SubMetering3, type="l", col="Blue")
 legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Prints the histogram on file

dev.copy(png, filename="plot3.png", width=480,height=480,units="px")

dev.off()


