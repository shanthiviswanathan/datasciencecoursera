# Data should be in the same location as working dir and this script.
#

## Loading Data--This first line will likely take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract Data & Prepare
cars <- as.character(SCC[grepl("Vehicles", SCC$EI.Sector),1])
MDCars <- subset(NEI, (SCC %in% cars))
MDCars <- subset(MDCars, fips == "24510")

# Sum Emissions for Cars
MDCarsEmissionsPerYear <- tapply(MDCars$Emissions, MDCars$year, sum)
# Convert to Data Frame for ggplot
MDCarsEmissionsPerYear <- as.data.frame(MDCarsEmissionsPerYear)

#Plot & Save
p <- ggplot(MDCarsEmissionsPerYear, aes(x = row.names(MDCarsEmissionsPerYear), y= MDCarsEmissionsPerYear, group =1))
p <- p + geom_line() + labs(y = "Vehicle Emissions", x = "Year")
ggsave(filename="plot5.png", p)