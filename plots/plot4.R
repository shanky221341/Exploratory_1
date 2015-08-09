library(dplyr)
library(readr)
library(ggplot2)

list.of.packages <- c("dplyr","readr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,repos="http://cran.ma.imperial.ac.uk/")



dat<-read_csv2("household_power_consumption.txt")

dat_mod<-dat %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007" )

dates <- dat_mod$Date
times <- dat_mod$Time
x <- paste(dates, times)
time<-strptime(x,"%d/%m/%Y %H:%M:%S")
dat_mod<-dat_mod[,2:9]
dat_mod<-data.frame(time,dat_mod)

par(mfrow=c(2,2))
plot(dat_mod$time,dat_mod$Global_active_power,type = "l",xlab="",ylab="Global Active Power (Kilowatts)")
plot(dat_mod$time,dat_mod$Voltage,type = "l",xlab="datetime",ylab="Voltage")
plot(dat_mod$time,dat_mod$Sub_metering_1,type="l",ylim=range(dat_mod$Sub_metering_1),col="black",xlab="",ylab="Energy sub metering")
par(new=TRUE)
plot(dat_mod$time,dat_mod$Sub_metering_2,type="l",ylim=range(dat_mod$Sub_metering_1),col="red",xlab = "",ylab = "")
par(new=TRUE)
plot(dat_mod$time,dat_mod$Sub_metering_3,type="l",ylim=range(dat_mod$Sub_metering_1),col="blue",xlab = "",ylab = "")
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","SUb_metering_3"))
plot(dat_mod$time,dat_mod$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()