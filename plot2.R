plot2 <- function() {
  #load the file, correcting the NAs (? to NA) and separating by ";"
  file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  #convert the Date column to POSIXlt via strptime
  file$Date <- strptime(file$Date, format="%d/%m/%Y")
  #convert the Date column to a Date data type
  file$Date <- as.Date(file$Date)
  #subset the file based on the two dates outlined in the assignment
  file <- file[file$Date >= as.Date("2007-02-01") & file$Date <= as.Date("2007-02-02"), ]
  
  #create the line graph
  plot(file$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
  #fix the x-axis ticks (done manually at the indices for the day of week)
  axis(1, at = c(1, 1440, 2879), label = c("Thu", "Fri", "Sat"))
  
  #copy the graph to a .png file
  dev.copy(png, filename = "plot2.png", width = 480, height = 480)
  dev.off()
  print("Done with plot2.")
}