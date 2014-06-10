# Make sure the data files and the R scripts are in the same directory
# Set R working directory to the location of the script and data files
#

library("ggplot2")

## Loading Data--This may take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract Data & Prepare
MD <- subset(NEI, NEI$fips == 24510)
emissionsPerType <- aggregate(MD$Emissions, by = list(MD$year, MD$type), 
                              FUN = "sum")
names(emissionsPerType) <- c("Year", "Type", "Emissions")

#Plot
p <- qplot(Year, Emissions, data = emissionsPerType, color=Type, geom = "line")
ggsave(filename="plot3.png", plot=p)
