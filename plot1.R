#row<-2075259
#columns<-9
#row*columns*8/2^20


library(sqldf)

file="/Users/yanx/Downloads/EDA/P1/household_power_consumption.txt"
df0<-read.csv.sql(file,sql='select * from file where Date ="1/2/2007" or Date ="2/2/2007"',sep=';',header=TRUE)
df<-data.frame(df0,na.strings="?")

png("/Users/yanx/Downloads/EDA/P1/plot1.png",width=480,height=480)
hist(df$Global_active_power,xlab="Global Active Power (kilowatts)", col="red",main="Global Active Power",xlim=c(0,6),ylim=c(0,1200))
dev.off()
