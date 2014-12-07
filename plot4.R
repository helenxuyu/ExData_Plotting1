data_original<- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_original$Date <- as.Date(data_original$Date, format="%d/%m/%Y")
data <- subset(data_original,Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- paste(as.Date(data$Date), data$Time)
data$Date_time <- as.POSIXct(datetime)

png("plot4.png", height=480, width=480)
par(mfrow = c(2, 2))

plot(data$Date_time, data$Global_active_power, 'l', xlab = "", ylab = "Global Active Power")

plot(data$Date_time, data$Voltage, 'l', xlab = "datetime", ylab = "Voltage")

plot(data$Date_time, data$Sub_metering_1, 'l', xlab = "", ylab = "Energy sub metering")
lines(data$Date_time, data$Sub_metering_2, 'l', col = "red")
lines(data$Date_time, data$Sub_metering_3, 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(data$Date_time, data$Global_reactive_power, 'l', xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
