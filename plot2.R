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

#setting locale
Sys.setlocale("LC_TIME","C")
#making dataset
colnames(data) <- datalabel[,1:9]
data2 <- mutate(data,Date_Time = paste(Date,Time))
data2$Date_Time <- strptime(data2$Date_Time, "%d/%m/%Y %H:%M:%S")

##plot2
png(filename = "plot2.png")
plot(data2$Date_Time,
     data2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
