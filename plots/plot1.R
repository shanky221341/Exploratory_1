
library(dplyr)
library(readr)
library(ggplot2)

list.of.packages <- c("dplyr","readr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,repos="http://cran.ma.imperial.ac.uk/")



dat<-read_csv2("household_power_consumption.txt")

dat_mod<-dat %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007" )

png("plot1.png")
hist(dat_mod$Global_active_power,col="red",xlab="Gobal Active Power(Kilowatts)",main = "Gobal Active Power")
dev.off()