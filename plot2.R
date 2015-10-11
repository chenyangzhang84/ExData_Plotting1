setwd("C:/Users/John/Documents/R/Exploratory data analysis")
df = read.csv2("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)
df = subset(df, Date %in% c("1/2/2007","2/2/2007"))

time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(df$Global_active_power)
png("plot2.png", width=480, height=480)

plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()