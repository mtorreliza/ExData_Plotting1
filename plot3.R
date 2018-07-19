#Read Data files
data <- read.table("./household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE,
                   header = TRUE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- data %>% filter(Date %in% as.Date(c('2007-02-01','2007-02-02')))
data$Global_active_power<- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(datetime,data$Sub_metering_1,type = "n",xlab="",ylab = "Global Active Power (kilowatts)")
points(datetime,data$Sub_metering_1,type = "l")
points(datetime,data$Sub_metering_2,type = "l",col = "red")
points(datetime,data$Sub_metering_3,type = "l",col = "blue")
legend("topright",lty = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2",
                                                         "Sub_metering_3"))
dev.off()
