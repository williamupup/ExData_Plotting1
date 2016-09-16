setwd("C:/Users/Haonan/Desktop/Study/R/exploratory project")
files <- file('./household_power_consumption.txt')
subsetted <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

#Plot3
combinetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("Plot3.png", width = 480, height = 480)
plot(combinetime, subsetted$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(combinetime,subsetted$Sub_metering_1, type = "l",  col = "black")
lines(combinetime,subsetted$Sub_metering_2, type = "l",  col = "red")
lines(combinetime,subsetted$Sub_metering_3, type = "l",  col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty = 1)
dev.off()
