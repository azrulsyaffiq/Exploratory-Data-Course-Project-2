# Setting working directory
setwd("~/Desktop/Exploratory Data Analysis/Week 3/Course Project 2/exdata-data-NEI_data")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480,bg="white")

barplot(
    height=aggTotals$Emissions,
    names.arg=aggTotals$year,
    xlab="Year",
    ylab=expression('total PM'[2.5]*' emission'),
    main=expression('Total PM'[2.5]*' emissions at various years')
)

dev.off()
