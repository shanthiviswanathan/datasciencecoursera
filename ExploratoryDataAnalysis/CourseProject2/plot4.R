# Make sure the data files and the R scripts are in the same directory
# Set R working directory to the location of the script and data files
#

library("ggplot2")

## Loading Data--This may take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract Coal & Combustion Data 
coalSCC <- subset(SCC, grepl("Combustion", SCC.Level.One) & 
                    grepl("Coal", SCC.Level.Three))
coalNEI <- subset(NEI, NEI$SCC %in% coalSCC$SCC)

# Plot & Save
p <- qplot(year, Emissions, data=coalNEI, geom=c("smooth"), 
           method="lm", ylab="Coal Emissions") 
ggsave(filename="plot4.png", p)
