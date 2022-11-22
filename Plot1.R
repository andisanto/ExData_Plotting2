
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
#for each of the years 1999, 2002, 2005, and 2008.


#get data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#make total
df1 <- aggregate(Emissions ~ year,NEI, sum)

head(df1)

png("~/ExData_Plotting2/Plot1.png",width=480,height=480,units="px",bg="transparent")
plot(df1, type = "o", main = "Total PM2.5 Emissions", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "darkblue", lty = 6)


dev.off()



