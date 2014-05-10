library(sqldf)

##### ref discussion forum : https://class.coursera.org/exdata-002/forum/thread?thread_id=47
myFile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myFile,mySql,header=TRUE,sep=";")

##### replace missing data represented by '?' by NA and find the sum of missing values
myData[ myData == "?" ] = NA
sum(is.na(myData))


dateMod<-as.Date(myData$Date,format="%d/%m/%Y")
datetime <- as.POSIXct(paste(dateMod, myData$Time), format="%Y-%m-%d %H:%M:%S")

################## Plot 2 ########################
png(file="plot2.png",height=480, width=480,bg='transparent')
plot(datetime,myData$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()