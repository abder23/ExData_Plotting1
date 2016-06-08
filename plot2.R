##this function construct plot2



mydata <- read.table(file = "c:/coursera/household_power_consumption.txt", sep=";", header=TRUE)

datasub1 <- subset(mydata, Date == "1/2/2007")
datasub2 <- subset(mydata, Date == "2/2/2007")

datasub <- rbind(datasub1, datasub2)

datasub$DateTime <- paste(datasub$Date, datasub$Time)
datasub$DateTime <- strptime(datasub$DateTime, "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(datasub$Global_active_power)/500
dt <- datasub$DateTime

png(file="plot2.png", width = 480, height = 480)

plot(dt, gap, type="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.off()
