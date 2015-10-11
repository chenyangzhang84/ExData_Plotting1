df = read.csv2("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)
df = subset(df, Date %in% c("1/2/2007","2/2/2007"))

time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(df$Global_active_power)
sub1 <- as.numeric(df$Sub_metering_1)
sub2 <- as.numeric(df$Sub_metering_2)
sub3 <- as.numeric(df$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(time, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(time, sub2, type="l", col="red")
lines(time, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()