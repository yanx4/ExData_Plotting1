#row<-2075259
#columns<-9
#row*columns*8/2^20


library(sqldf)
file="/Users/yanx/Downloads/EDA/P1/household_power_consumption.txt"
df0<-read.csv.sql(file,sql='select * from file where Date ="1/2/2007" or Date ="2/2/2007"',sep=';',header=TRUE)
df<-data.frame(df0,na.strings="?")
df$Date <-as.Date(df$Date,format="%d/%m/%Y")
df$Datetime<-as.POSIXlt(paste(df$Date,df$Time, sep=" "))

png("/Users/yanx/Downloads/EDA/P1/plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(df$Datetime, df$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(df$Datetime, df$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(df$Datetime,df$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
lines(df$Datetime,df$Sub_metering_2,type="l",col="red")
lines(df$Datetime,df$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")

plot(df$Datetime, df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reative_power")
dev.off()
