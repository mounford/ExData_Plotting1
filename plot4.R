
x <- read.table("household_power_consumption.txt",na.strings = "?",sep=";",header = TRUE)
ds <- subset(x, as.Date(x$Date,"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(x$Date,"%d/%m/%Y") <=as.Date("02/02/2007", "%d/%m/%Y"))
ds$Date <- as.POSIXct(paste(as.Date(ds$Date,"%d/%m/%Y"),ds$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",width = 480, height = 480)
attach(mtcars) # Agrupar los graficos
par(mfrow = c(2, 2)) #Ordenar los graficos en 2 filas y 2 columnas
with(ds, {
  plot(Date,Global_active_power, type = "l")
  plot(Date, Voltage,  xlab="Datetime", ylab="Voltage", type = "l")
  plot(ds$Date, ds$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")
  lines(ds$Date, ds$Sub_metering_2,col="red")
  lines(ds$Date, ds$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"),lty = 1)
  
  plot(Date, Global_reactive_power,  xlab="Datetime", type = "l")
  
})
dev.off()