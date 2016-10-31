## Reading the data
data<-"F:/BENHUR FOLDER/Coursera/Exploratory Data Analysis/household_power_consumption.txt"
readfile<-read.table(data,header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
file_subset<-readfile[readfile$Date %in% c("1/2/2007","2/2/2007"),]

## code that creates the PNG file
Date_Time <- strptime(paste(file_subset$Date, file_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Submetering1 <- as.numeric(file_subset$Sub_metering_1)
Submetering2 <- as.numeric(file_subset$Sub_metering_2)
Submetering3 <- as.numeric(file_subset$Sub_metering_3)
png("Plot3.png", width=480, height=480)
plot(Date_Time, Submetering1, type="l",xlab="",ylab="Energy Sub metering")
lines(Date_Time, Submetering2, type="l", col="red")
lines(Date_Time, Submetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5, col=c("black","red","blue"))
dev.off()