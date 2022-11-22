
#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?


library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

coalNEI  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subcoalNEISCC <- NEISCC[coalNEI, ]



png("~/ExData_Plotting2/Plot4.png",width=480,height=480,units="px",bg="transparent")
plot <- ggplot(subcoalNEISCC, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot)
dev.off()