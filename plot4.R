setwd("/Users/danabeuschel/Desktop/coursera/data science/rprog")
names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", sep=";", col.names = names, na.strings = "?", skip = 66637, nrows = 2879)

data$Time = paste(data$Date, data$Time)
data$Time = strptime(data$Time, format="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
#plot 1
plot(data$Time, data$Global_active_power, type="n",ylab="Global Active Power", xlab="")
lines(data$Time, data$Global_active_power)
# plot 2
plot(data$Time, data$Voltage, type="n",ylab="Voltage", xlab="datetime")
lines(data$Time, data$Voltage)
# plot 3
plot(data$Time, data$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
#plot 4
plot(data$Time, data$Global_reactive_power, type="n",ylab="Global Rective Power", xlab="datetime")
lines(data$Time, data$Global_reactive_power)
dev.off()