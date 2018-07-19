library(dplyr)
#Download Zip File
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"Power_Consumption.zip",mode = "wb")
unzip("Power_Consumption.zip")


#Read Data files
data <- read.table("./household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE,
                   header = TRUE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- data %>% filter(Date %in% as.Date(c('2007-02-01','2007-02-02')))
data$Global_active_power<- as.numeric(data$Global_active_power)


png("plot1.png", width=480, height=480)
hist(data$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()



