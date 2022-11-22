#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#(\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore
sub <- subset(NEI, fips == "24510")

#make total
df1 <- aggregate(Emissions ~ year,sub, sum)

head(df1)

png("~/ExData_Plotting2/Plot2.png",width=480,height=480,units="px",bg="transparent")
plot(df1, type = "o", main = "Total PM2.5 Emissions In Baltimore City", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "darkblue", lty = 6)
axis(1, at = 1999:2008)

dev.off()
