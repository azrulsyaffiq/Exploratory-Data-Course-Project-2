# Setting working directory
setwd("~/Desktop/Exploratory Data Analysis/Week 3/Course Project 2/exdata-data-NEI_data")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Upload ggplot2
library(ggplot2)

# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480,bg="transparent")

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="grey",width=0.75) +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) + 
    labs(title=expression("Total Emission from coal sources from 1999 to 2008"))

print(ggp)

dev.off()