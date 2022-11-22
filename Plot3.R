#Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore
sub <- subset(NEI, fips == "24510")

#make total
df1 <- aggregate(Emissions ~ year + type,sub, sum)


png("~/ExData_Plotting2/Plot3.png",width=480,height=480,units="px",bg="transparent")

plot<- ggplot(df1,aes(x=factor(year), y=Emissions, colour=type, group = type) )+ geom_line()+ ggtitle("Total PM2.5 Emissions in Baltimore by Source Type") + xlab("Year") + ylab("PM2.5 Emissions")                                                           

print(plot)

dev.off()
