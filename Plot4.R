## Reading the data
data<-"F:/BENHUR FOLDER/Coursera/Exploratory Data Analysis/household_power_consumption.txt"
readfile<-read.table(data,header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
file_subset<-readfile[readfile$Date %in% c("1/2/2007","2/2/2007"),]

## code that creates the PNG file
Date_Time <- strptime(paste(file_subset$Date, file_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(file_subset$Global_active_power)
GlobalReactivePower <- as.numeric(file_subset$Global_reactive_power)
Voltage <- as.numeric(file_subset$Voltage)
Submetering1 <- as.numeric(file_subset$Sub_metering_1)
Submetering2 <- as.numeric(file_subset$Sub_metering_2)
Submetering3 <- as.numeric(file_subset$Sub_metering_3)

png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(Date_Time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.5)

plot(Date_Time, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Date_Time, Submetering1, type="l",xlab="",ylab="Energy Sub metering")
lines(Date_Time, Submetering2, type="l", col="red")
lines(Date_Time, Submetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.0, col=c("black","red","blue"),bty="n")

plot(Date_Time, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()