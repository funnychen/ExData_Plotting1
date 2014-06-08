## Read data
power.data <- read.csv2("household_power_consumption.txt", 
                        skip = 66636, nrows = 2880,
                        col.names = c("date", "time", "global.active.power",
                                      "global.reactive.power", "voltage",
                                      "global.intensity", "sub.metering.1",
                                      "sub.metering.2", "sub.metering.3"),
                        stringsAsFactors = FALSE, na.strings = "?")

## Plot histogram of global active power and save to a png file
png(filename = "plot1.png")

par(mfrow = c(1, 1))

hist(as.numeric(power.data$global.active.power), col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

