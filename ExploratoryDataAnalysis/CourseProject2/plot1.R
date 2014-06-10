# Make sure the data files and the R scripts are in the same directory
# Set R working directory to the location of the script and data files
#

## Loading Data--This may take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum all emissions per year
emissionsPerYear <- rowsum(NEI$Emissions, NEI$year)

# Plot and Save to File
png("plot1.png")
plot(rownames(emissionsPerYear), emissionsPerYear, 
     xlab="Year", ylab="Total Emissions", type="l")
dev.off()
