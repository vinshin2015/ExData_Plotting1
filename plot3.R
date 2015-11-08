# Read and subset the file
power<-read.csv2("./household_power_consumption.txt")
Feb2007<-power[(as.Date(power$Date, "%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y" )) & as.Date(power$Date, "%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]


#Plot 3
with(Feb2007, plot(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_1))),col="black", type="n", xlab ="", ylab="Energy Sub metering"))
with(Feb2007, points(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_1))),col="black", type="s"))
with(Feb2007, points(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_2))),col="red", type="s"))
with(Feb2007, points(x,na.omit(as.numeric(as.character(Feb2007$Sub_metering_3))),col="blue", type="s"))
legend("topright", lwd = 3, col = c("black","red","blue"), legend= c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
dev.copy(png, file="plot3.png")
dev.off()
