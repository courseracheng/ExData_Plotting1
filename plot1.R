
## read in data
require("sqldf")
data = read.csv.sql("data/household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                  header=TRUE, sep = ";")

## Plot figures
png(filename="plot1.png",width = 480, height = 480)

hist(data$Global_active_power, col = 'red',
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)')

dev.off()
