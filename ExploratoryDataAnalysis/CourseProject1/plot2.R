# Plot 2. Data set should be in workdir with scripts.

# Read Data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract the data pertaining to 1/2/2007 and 2/2/2007 dates
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Merge Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Open png device
png("plot2.png", width=480, height=480)

# Plot the graph
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Turn off device
dev.off()