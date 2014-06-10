# Data should be in the same location as working dir and this script.
#

## Loading Data--This first line will likely take a few seconds.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract Data & Prepare
cars <- as.character(SCC[grepl("Vehicles", SCC$EI.Sector),1])
MD_LA_Cars <- subset(NEI, (SCC %in% cars))
MD_LA_Cars <- subset(MD_LA_Cars, fips %in% c("24510", "06037"))

# Sum Cars Emissions Per Year
cepy <- aggregate(MD_LA_Cars$Emissions, by = list(MD_LA_Cars$year, MD_LA_Cars$fips), FUN = "sum")
names(cepy)<- c("year", "fips", "Emissions")
# Convert to Data Frame for ggplot
cepy <- data.frame(cepy)
# Separate Locations
cepy$city <- "LA County"
cepy$city[cepy$fips == "24510"] <- "Baltimore City"

# Plot & Save
p <- ggplot(cepy, aes(x = year, y= Emissions, col = city))
p <- p + geom_line() + labs(y = "Emissions", x = "year")
ggsave(filename="plot6.png", p)