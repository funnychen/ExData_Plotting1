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

## Plot
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
       lty = 1, col = c("black", "red", "blue"), y.intersp = 0.2,
       cex = 0.6, text.width = strwidth("Sub_metering_1") * 0.8, bty = "n")

plot(power.data$time, power.data$global.reactive.power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

## Save to a png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
