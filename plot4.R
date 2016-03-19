plot4 <- function() {
  #load the file, correcting the NAs (? to NA) and separating by ";"
  file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  #convert the Date column to POSIXlt via strptime
  file$Date <- strptime(file$Date, format="%d/%m/%Y")
  #convert the Date column to a Date data type
  file$Date <- as.Date(file$Date)
  #subset the file based on the two dates outlined in the assignment
  file <- file[file$Date >= as.Date("2007-02-01") & file$Date <= as.Date("2007-02-02"), ]
  
  #set up the device for a 2x2 area
  par(mfrow = c(2, 2))
  
  #create the [1,1] graph
  plot(file$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n")
  #fix the x-axis ticks (done manually at the indices for the day of week)
  axis(1, at = c(1, 1440, 2879), label = c("Thu", "Fri", "Sat"))
  
  #create the [1,2] graph
  plot(file$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n")
  axis(1, at = c(1, 1440, 2879), label = c("Thu", "Fri", "Sat"))
  
  #create the [2,1] graph
  plot(file$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
  points(file$Sub_metering_2, type = "l", col = "red")
  points(file$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex = 0.75)
  axis(1, at = c(1, 1440, 2879), label = c("Thu", "Fri", "Sat"))
  
  #create the [2,2] graph
  plot(file$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n")
  axis(1, at = c(1, 1440, 2879), label = c("Thu", "Fri", "Sat"))
  
  #copy the graph to a .png file
  dev.copy(png, filename = "plot4.png", width = 480, height = 480)
  dev.off()
  print("Done with plot4.")
}