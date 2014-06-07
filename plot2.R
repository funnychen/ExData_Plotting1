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

## Plot global active power against time
par(mfrow = c(1, 1))

plot(power.data$time, power.data$global.active.power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Save to a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
