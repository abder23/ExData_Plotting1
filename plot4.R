##this function construct plot2



mydata <- read.table(file = "c:/coursera/household_power_consumption.txt", sep=";", header=TRUE)

datasub1 <- subset(mydata, Date == "1/2/2007")
datasub2 <- subset(mydata, Date == "2/2/2007")

datasub <- rbind(datasub1, datasub2)
datasub$DateTime <- paste(datasub$Date, datasub$Time)
datasub$DateTime <- strptime(datasub$DateTime, "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(datasub$Global_active_power)/500

esm1 <- as.numeric(datasub$Sub_metering_1)
esm2 <- as.numeric(datasub$Sub_metering_2)
esm3 <- as.numeric(datasub$Sub_metering_3)

png(file="plot4.png", width = 480, height = 480)
dt <- datasub$DateTime

n.col <- 2 
n.row <- 2
par(mfcol = c(n.col, n.row), font=20)

##Plot 1 col1 row1
plot(dt, gap, type="l", xlab = "", ylab="Global Active Power (kilowatts)")

##Plot 2 col1 row2
par(font=20)
plot(dt, esm1, ylim=range(c(2,40)),  xlab = "", type="l", ylab="Energy sub metering")
par(new = TRUE)
plot(dt, esm2, ylim=range(c(2,esm2*5)), type="l", axes = FALSE, xlab = "", ylab = "", col = "red")
par(new = TRUE)
plot(dt, esm3, ylim=range(c(esm1,esm3)), type="l", axes = FALSE, xlab = "", ylab = "", col = "blue") 
legend("topright", col=c("black","blue", "red"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), text.width = strwidth("1,1,000"),bty = "n", lty = 1:1, xjust = 1, yjust = 0.5, cex=0.5, pt.cex = 1:3, lwd = 0.5, adj = c(0,0))

##Plot 3 col2 row1
vt <- as.numeric(datasub$Voltage)
plot(dt, vt, type="l", xlab = "datetime", ylab="Voltage")

##Plot 4 col2 row2
grp <- as.numeric(datasub$Global_reactive_power)/400
plot(dt, grp, type="l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()
