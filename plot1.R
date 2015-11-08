# Read and subset the file
power<-read.csv2("./household_power_consumption.txt")
Feb2007<-power[(as.Date(power$Date, "%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y" )) & as.Date(power$Date, "%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]

#Plot 1
plot1<-hist(as.numeric(as.character(Feb2007$Global_active_power)),col="red", main="Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
