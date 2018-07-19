#Read Data files
data <- read.table("./household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE,
                   header = TRUE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- data %>% filter(Date %in% as.Date(c('2007-02-01','2007-02-02')))
data$Global_active_power<- as.numeric(data$Global_active_power)


datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(datetime,Global_active_power,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()