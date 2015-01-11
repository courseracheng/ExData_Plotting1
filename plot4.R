
## read in data
require("sqldf")
data = read.csv.sql("data/household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                    header=TRUE, sep = ";")

datetime = paste(data$Date, data$Time)
datetime = strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Plot figures
png(filename="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

plot(datetime, data$Global_active_power, type="l",
     ylab='Global Active Power', xlab="")


plot(datetime, data$Voltage, type='l',
     xlab='datetime',ylab='Voltage')


plot(datetime, data$Sub_metering_1, type="l",
     ylab='Energy sub metering', xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red",
      ylab='Energy sub metering', xlab="")
lines(datetime, data$Sub_metering_3, type="l", col="blue",
      ylab='Energy sub metering', xlab="")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"), 
       lwd=2, col= c("black","red", "blue"), bty="n")

plot(datetime, data$Global_reactive_power, type='l',
     xlab='datetime',ylab='Global_reactive_power')

dev.off()

