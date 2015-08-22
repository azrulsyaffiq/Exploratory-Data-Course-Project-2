# Setting working directory
setwd("~/Desktop/Exploratory Data Analysis/Week 3/Course Project 2/exdata-data-NEI_data")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot2.png",width=480,height=480,bg="white")

barplot(
    height=aggTotalsBaltimore$Emissions,
    names.arg=aggTotalsBaltimore$year,
    xlab="Year",
    ylab=expression('total PM'[2.5]*' emission'),
    main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years')
)

dev.off()
