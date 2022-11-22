
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#NEISCC <- merge(NEI, SCC, by="SCC")


sub <- subset(NEI, fips == "24510" & type=="ON-ROAD")

df1 <- aggregate(Emissions ~ year + type,sub, sum)

png("~/ExData_Plotting2/Plot5.png",width=480,height=480,units="px",bg="transparent")
qplot(year, Emissions, data = df1,colour=type, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore") + xlab("Year") + ylab("Emission Levels")

dev.off()