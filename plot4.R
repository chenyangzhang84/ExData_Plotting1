setwd("C:/Users/John/Documents/R/Exploratory data analysis")
df = read.csv2("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)
df = subset(df, Date %in% c("1/2/2007","2/2/2007"))

time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(df$Global_active_power)
globalReactivePower <- as.numeric(df$Global_reactive_power)
voltage <- as.numeric(df$Voltage)
sub1 <- as.numeric(df$Sub_metering_1)
sub2 <- as.numeric(df$Sub_metering_2)
sub3 <- as.numeric(df$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(time, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(time, sub2, type="l", col="red")
lines(time, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
