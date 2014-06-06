# Plot 1. Data set should be in workdir with scripts.

# Read Data file
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract the data pertaining to 1/2/2007 and 2/2/2007 dates
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Open png device
png("plot1.png", width=480, height=480)

# Plot the graph
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# Turn off device
dev.off()