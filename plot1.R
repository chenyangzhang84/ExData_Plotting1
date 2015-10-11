df = read.csv2("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)
df = subset(df, Date %in% c("1/2/2007","2/2/2007"))

png("plot1.png", width=480, height=480)

hist(as.numeric(df$Global_active_power), xlab = "Global active power (Kilowatts)", col = 'red', main = "Global Active Power")

dev.off()
