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
##############Plot 3 #############################
png(file="plot3.png",height=480, width=480,bg=
      'transparent')
yr<-range(c(myData$Sub_metering_1,myData$Sub_metering_2,myData$Sub_metering_3))
plot(range(datetime),yr,xlab=" ",ylab="Energy sub metering",type="n")
lines(datetime,myData$Sub_metering_1,type='l',col='black')
lines(datetime,myData$Sub_metering_2,type='l',col='red')
lines(datetime,myData$Sub_metering_3,type='l',col='blue')
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


