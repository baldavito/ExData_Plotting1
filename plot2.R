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
plot(Days,Global_active_power,type="l", ylab="Gloabal Active Power (kilowatts)")

# Prints the histogram on file

dev.copy(png, filename="plot2.png", width=480,height=480,units="px")

dev.off()

