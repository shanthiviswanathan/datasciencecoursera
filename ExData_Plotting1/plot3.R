# Plot 3. Data set should be in workdir with scripts.

# Read Data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract the data pertaining to 1/2/2007 and 2/2/2007 dates
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Merge Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Open png device
png("plot3.png", width=480, height=480)

# Plot the graph
plot(data$DateTime, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

# Turn off device
dev.off()