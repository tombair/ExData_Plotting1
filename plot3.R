data <- read.table(file="household_power_consumption.txt",header = TRUE,sep=";",na.strings = c("?"))
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")
sub_data <- subset(data, (Date >= as.Date("2007-02-01")&(Date <= as.Date("2007-02-02")) ))
dim(sub_data)
png("plot3.png")
plot(strptime(paste(sub_data$Date,sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"), sub_data$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="") 
lines(strptime(paste(sub_data$Date,sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"),sub_data$Sub_metering_2, type="l",col="red")
lines(strptime(paste(sub_data$Date,sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"),sub_data$Sub_metering_3, type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty = 1,bty="n")
dev.off()