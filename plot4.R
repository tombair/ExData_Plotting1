data <- read.table(file="household_power_consumption.txt",header = TRUE,sep=";",na.strings = c("?"))
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")
sub_data <- subset(data, (Date >= as.Date("2007-02-01")&(Date <= as.Date("2007-02-02")) ))
dim(sub_data)
png("plot4.png")
par(mfrow = c(2,c))

hist(as.numeric(sub_data$Global_active_power),col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

plot(strptime(paste(sub_data$Date,sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), sub_data$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="") 
lines(strptime(paste(sub_data$Date,sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"),sub_data$Sub_metering_2, type="l",col="red")
lines(strptime(paste(sub_data$Date,sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"),sub_data$Sub_metering_3, type="l",col="blue")
legend("topright",legend = "test",bty = "o")
dev.off()