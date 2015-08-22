# Setting working directory
setwd("~/Desktop/Exploratory Data Analysis/Week 3/Course Project 2/exdata-data-NEI_data")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Upload ggplot2
library(ggplot2)

# Subset NEI data by Baltimore's fip.
subsetNEI  <- NEI[NEI$fips=="24510", ]

# Aggregate using sum the Baltimore emissions data by year
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
    xlab("Year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City from 1999 to 2008 by Source Type')
print(g)
dev.off()