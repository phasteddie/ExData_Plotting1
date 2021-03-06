setwd("/Users/danabeuschel/Desktop/coursera/data science/rprog")
names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", sep=";", col.names = names, na.strings = "?", skip = 66637, nrows = 2879)


data$Time = paste(data$Date, data$Time)
data$Time = strptime(data$Time, format="%d/%m/%Y %H:%M:%S")

png(file = "plot1.png",width = 480, height = 480)

hist(data$Global_active_power, col= "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

