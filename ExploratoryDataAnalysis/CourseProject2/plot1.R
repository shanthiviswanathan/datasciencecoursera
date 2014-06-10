# Data should be in the same location as working dir and this script.
#

## Loading Data--This first line will likely take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum all emissions per year
emissionsPerYear <- rowsum(NEI$Emissions, NEI$year)

# Plot and Save to File
png("plot1.png")
plot(rownames(emissionsPerYear), emissionsPerYear, 
     xlab="Year", ylab="Total Emissions", type="l")
dev.off()