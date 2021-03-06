setwd("C:/Users/Haonan/Desktop/Study/R/exploratory project")
files <- file('./household_power_consumption.txt')
subsetted <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


#Plot2
datetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("Plot2.png", width = 480, height = 480)
plot(datetime, subsetted$Global_active_power, xlab = " ", ylab = "Global Active Power (killowatts)", type = "l")
dev.off()
