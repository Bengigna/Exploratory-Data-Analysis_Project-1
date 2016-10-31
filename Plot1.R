## Reading the data
data<-"F:/BENHUR FOLDER/Coursera/Exploratory Data Analysis/household_power_consumption.txt"
readfile<-read.table(data,header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
file_subset<-readfile[readfile$Date %in% c("1/2/2007","2/2/2007"),]

## code that creates the PNG file
globalActivePower <- as.numeric(file_subset$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(globalActivePower,col="red",xlab="Global Active Power (Kilowatts)", main="Global Active Power")
dev.off()