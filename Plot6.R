#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



sub1 <- subset(NEI, fips == "24510" & type=="ON-ROAD")

df1 <- aggregate(Emissions ~ year + fips,sub1, sum)

sub2 <- subset(NEI, fips == "06037" & type=="ON-ROAD")

df2 <- aggregate(Emissions ~ year + fips,sub2, sum)

df <-rbind(df1, df2)

png("~/ExData_Plotting2/Plot6.png",width=880,height=480,units="px",bg="transparent")
qplot(year, Emissions, data = df,colour=fips, geom= "line") + theme_gray() + ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008') + xlab("Year") + ylab("Emission Levels")

dev.off()