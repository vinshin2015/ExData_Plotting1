#Reading the initial file
power<-read.csv2("./household_power_consumption.txt")
#Subsetting the file
Feb2007<-power[(as.Date(power$Date, "%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y" )) & as.Date(power$Date, "%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]
#x is used again and again hence creating it once.
x<-strptime(paste(Feb2007$Date,Feb2007$Time) ,"%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2), mar=c(4,4,4,1), oma=c(1,1,1,1))
with(Feb2007,{
  #Plot 1
  plot(x,na.omit(as.numeric(as.character(Feb2007$Global_active_power))),type ="s", ylab = "Global Active Power (Kilowatts)", xlab="")
  #plot 2
  plot(x,na.omit(as.numeric(as.character(Feb2007$Voltage))),type ="s", ylab = "Voltage", xlab = "Datetime")
  #plot 3
  plot(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_1))),col="black", type="n", xlab ="", ylab="Energy Sub metering")
  with(Feb2007, points(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_1))),col="black", type="s"))     
  with(Feb2007, points(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_2))),col="red", type="s"))
  with(Feb2007, points(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_3))),col="blue", type="s"))
  legend("topright", lwd = 3, col = c("black","red","blue"), legend= c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
  #plot 4
  plot(x,na.omit(as.numeric(as.character(Feb2007$Global_reactive_power))),type ="l", ylab = "Global_reactive_power", xlab = "Datetime")
})
dev.copy(png,file="plot4.png")
dev.off()