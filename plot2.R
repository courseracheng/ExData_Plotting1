
## read in data
require("sqldf")
data = read.csv.sql("data/household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                    header=TRUE, sep = ";")

datetime = paste(data$Date, data$Time)

datetime = strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Plot figures
png(filename="plot2.png",width = 480, height = 480)

plot(datetime, data$Global_active_power, type="l",
     ylab='Global Active Power (kilowatts)', xlab="")

dev.off()
