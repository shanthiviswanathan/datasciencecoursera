# Make sure the data files and the R scripts are in the same directory
# Set R working directory to the location of the script and data files
#

## Loading Data--This may take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extrat Data & Sum Emissions
MD <- subset(NEI, NEI$fips == 24510)
MDEmissionsPerYear <- rowsum(MD$Emissions, MD$year)

# Plot and Save to File
png("plot2.png")
plot(rownames(MDEmissionsPerYear), MDEmissionsPerYear, xlab="Year", 
     ylab="Total emissions in Baltimore City, MD", type = "l")
dev.off()
