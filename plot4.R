#Read Data files
data <- read.table("./household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE,
                   header = TRUE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- data %>% filter(Date %in% as.Date(c('2007-02-01','2007-02-02')))
data$Global_active_power<- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#1
plot(datetime,data$Global_active_power,type = "l",xlab="",ylab = "Global Active Power")
#2
plot(datetime,data$Voltage,type = "l",xlab="",ylab = "Voltage")
#3
plot(datetime,data$Sub_metering_1,type = "n",xlab="",ylab = "Global Active Power (kilowatts)")
points(datetime,data$Sub_metering_1,type = "l")
points(datetime,data$Sub_metering_2,type = "l",col = "red")
points(datetime,data$Sub_metering_3,type = "l",col = "blue")
legend("topright",lty = 1,bty = "n", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2",
                                                                  "Sub_metering_3"))
#4
plot(datetime,data$Global_reactive_power,type = "l",xlab="",ylab = "Global Reactive Power")
dev.off()



