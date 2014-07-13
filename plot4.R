#plot1

#Read File

data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";")

# Subset it only with needed data

data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Define needed Variables
Global_active_power<-as.numeric(as.character(data$Global_active_power))
Voltage<-as.numeric(as.character(data$Voltage))
Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
Days <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) 
SubMetering1<-as.numeric(as.character(data$Sub_metering_1))
SubMetering2<-as.numeric(as.character(data$Sub_metering_2))
SubMetering3<-as.numeric(as.character(data$Sub_metering_3))

#plots the data
 par(mfrow=c(2,2), mar  =c(4,4,1,2))
 

 #plot 1
 plot(Days,Global_active_power,type="l", ylab="Gloabal Active Power (kilowatts)", xlab="")

 #plot 2
 plot(Days,Voltage,type="l", ylab="Voltage", xlab="datetime")
 

 #plot 3
 plot(Days,SubMetering1, type="l", col="black", ylab="Energy sub metering", xlab="")
 lines(Days,SubMetering2, type="l", col="red")
 lines(Days,SubMetering3, type="l", col="Blue")
 legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
 
#plot 4
  plot(Days,Global_reactive_power,type="l",, xlab="datetime")

# Prints the data on file

dev.copy(png, filename="plot4.png", width=480,height=480,units="px")

dev.off()
