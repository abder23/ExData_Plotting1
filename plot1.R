##this function construct plot1

 
  
  mydata <- read.table(file = "c:/coursera/household_power_consumption.txt", sep=";", header=TRUE)

  datasub1 <- subset(mydata, Date == "1/2/2007")
  datasub2 <- subset(mydata, Date == "2/2/2007")
  
  datasub <- rbind(datasub1, datasub2)
  
  gap <- as.numeric(datasub$Global_active_power)/500
  
  png(file="plot1.png", width = 480, height = 480)
  
  hist(gap, border="black", col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

  dev.off()
