# Read and subset the file
power<-read.csv2("./household_power_consumption.txt")
Feb2007<-power[(as.Date(power$Date, "%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y" )) & as.Date(power$Date, "%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]


#Plot 2
x<-strptime(paste(Feb2007$Date,Feb2007$Time) ,"%d/%m/%Y %H:%M:%S")
y<-na.omit(as.numeric(as.character(Feb2007$Global_active_power)))
plot(x,y, type ="s", ylab = "Global Active Power (Kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()