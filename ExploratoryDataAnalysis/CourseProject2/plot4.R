# Data should be in the same location as working dir and this script.
#

## Loading Data--This first line will likely take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extrat Coal Data & Prepare
coalSCC <- subset(SCC, grepl("Combustion", SCC.Level.One) & 
                    grepl("Coal", SCC.Level.Three))
coalNEI <- subset(NEI, NEI$SCC %in% coalSCC$SCC)

# Plot & Save
p <- qplot(year, Emissions, data=coalNEI, geom=c("smooth"), 
           method="lm", ylab="Coal Emissions") 
ggsave(filename="plot4.png", p)