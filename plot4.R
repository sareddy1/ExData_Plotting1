# Histogram for Global Active Power
setwd("C:/Sudhakar/coursera/04_ExploratoryDataAnalysis")

# read the data form the .txt file
data <- read.table("./data/household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
head(data)

# convert and assing the formating for data field
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# filter the date value based on the given dates
febdata <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

# loop through the 9 variables (9 columns)
for(i in 3:9) febdata[,i] <- as.numeric(febdata[,i])

# Generating multiple plot and line graphs in one file
png("./ExData_Plotting1/plot4.png")
par(mfrow=c(2,2))
with(febdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),
               Global_active_power,type='l',xlab="",
               ylab = 'Global Active Power (kilowatts)'))
with(febdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Voltage,
               type='l',xlab='datetime',ylab='Voltage'))
with(febdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(febdata,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(febdata,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
with(febdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),
               Global_reactive_power,type='l',xlab='datetime'))
dev.off()
