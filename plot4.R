## Assignment 

##downloading data
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url1,temp)
data <- read.table(unzip(temp, "household_power_consumption.txt"),
                   skip=66637,nrows=2880,sep= ";")
datalabel <- read.table(unzip(temp,"household_power_consumption.txt"),
                        nrows=1,sep=";",stringsAsFactors = FALSE)
unlink(temp)

#setting locale (for handle date/time data in English)
Sys.setlocale("LC_TIME","C")
#making dataset
colnames(data) <- datalabel[,1:9]
data2 <- mutate(data,Date_Time = paste(Date,Time))
data2$Date_Time <- strptime(data2$Date_Time, "%d/%m/%Y %H:%M:%S")


#plot4
png(filename="plot4.png")

par(mfrow=c(2,2))
#plot topleft
plot(data2$Date_Time,
     data2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

#plot topright
plot(data2$Date_Time,data2$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

#plot downleft
plot(data2$Date_Time,data2$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Every sub metering")
par(new=TRUE)
plot(data2$Date_Time,data2$Sub_metering_2,
     type="l",
     col="red",
     xlab="",
     ylab="",
     ylim=c(range(data2$Sub_metering_1)),
     axes=FALSE
)
par(new=TRUE)
plot(data2$Date_Time,data2$Sub_metering_3,
     type="l",
     col="blue",
     xlab="",
     ylab="",
     ylim=c(range(data2$Sub_metering_1)),
     axes=FALSE)
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n"
       )

#plot downright
plot(data2$Date_Time,data2$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()

