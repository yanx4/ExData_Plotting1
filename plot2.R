#row<-2075259
#columns<-9
#row*columns*8/2^20


library(sqldf)
file="/Users/yanx/Downloads/EDA/P1/household_power_consumption.txt"
df0<-read.csv.sql(file,sql='select * from file where Date ="1/2/2007" or Date ="2/2/2007"',sep=';',header=TRUE)
df<-data.frame(df0,na.strings="?")
df$Date <-as.Date(df$Date,format="%d/%m/%Y")
df$Datetime<-as.POSIXlt(paste(df$Date,df$Time, sep=" "))

png("/Users/yanx/Downloads/EDA/P1/plot2.png",width=480,height=480)
plot(df$Datetime, df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
