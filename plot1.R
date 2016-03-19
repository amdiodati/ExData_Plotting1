plot1 <- function() {
  #load the file, correcting the NAs (? to NA) and separating by ";"
  file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  #convert the Date column to POSIXlt via strptime
  file$Date <- strptime(file$Date, format="%d/%m/%Y")
  #convert the Date column to a Date data type
  file$Date <- as.Date(file$Date)
  #subset the file based on the two dates outlined in the assignment
  file <- file[file$Date >= as.Date("2007-02-01") & file$Date <= as.Date("2007-02-02"), ]
  
  #create the histogram
  hist(file$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts", col = "red")
  
  #copy the histogram to a .png file
  dev.copy(png, filename = "plot1.png", width = 480, height = 480)
  dev.off()
  print("Done with plot1.")
}