#plot1

#Read File

data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";")

# Subset it only with needed data

data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Create Variable Global_active_power
Global_active_power<-as.numeric(as.character(data$Global_active_power))

#plots the histogram
hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts", main="Global Active Power")

# Prints the histogram on file

dev.copy(png, filename="plot1.png", width=480,height=480,units="px")


dev.off()