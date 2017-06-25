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
#naming data column
colnames(data) <- datalabel[,1:9]


#plot1
png(filename = "plot1.png")
hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
