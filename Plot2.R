## Reading the data
data<-"F:/BENHUR FOLDER/Coursera/Exploratory Data Analysis/household_power_consumption.txt"
readfile<-read.table(data,header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
file_subset<-readfile[readfile$Date %in% c("1/2/2007","2/2/2007"),]

## code that creates the PNG file
Date_Time <- strptime(paste(file_subset$Date, file_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(file_subset$Global_active_power)
png("Plot2.png", width=480, height=480)
plot(Date_Time, globalActivePower, type="l",xlab="",ylab="Global Active Power (Kilowatts)")
dev.off()