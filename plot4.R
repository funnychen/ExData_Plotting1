## Read data
power.data <- read.csv2("household_power_consumption.txt", 
                        skip = 66636, nrows = 2880,
                        col.names = c("date", "time", "global.active.power",
                                      "global.reactive.power", "voltage",
                                      "global.intensity", "sub.metering.1",
                                      "sub.metering.2", "sub.metering.3"),
                        stringsAsFactors = FALSE, na.strings = "?")

power.data$time <- strptime(paste(power.data$date, power.data$time), 
                            "%e/%m/%Y %H:%M:%S")
power.data$date <- as.Date(power.data$date, format = "%e/%m/%Y")

## Plot and save to a png file
png(filename = "plot4.png")

par(mfrow = c(2, 2))

plot(power.data$time, power.data$global.active.power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(power.data$time, power.data$voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(power.data$time, power.data$sub.metering.1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(power.data$time, power.data$sub.metering.2, col = "red")
lines(power.data$time, power.data$sub.metering.3, col = "blue")
legend("topright", legend = paste("Sub_metering", 1:3, sep = "_"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")

plot(power.data$time, power.data$global.reactive.power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
