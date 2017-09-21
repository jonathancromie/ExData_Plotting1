source("functions.R")

main <- function() {
    # Load data into program
    loadData()
    
    ## Switch graphics device to png
    launchGraphicsDevice(name = "plot4.png")
    
    ## Set layout to two rows and two columns
    par(mfrow = c(2,2))
    
    ## Create plot
    datetime <- with(dataset, as.POSIXct(paste(date, time), 
                                         format="%d/%m/%Y %H:%M:%S"))
    with(dataset, {
        ## Plot Global Active Power
        plot(datetime, global_active_power, 
             xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
        lines(datetime, global_active_power)
        
        ## Plot Voltage
        plot(datetime, voltage, ylab = "Voltage", type = "n")
        lines(datetime, voltage)
        
        ## Plot Energy Sub Metering
        plot(datetime, sub_metering_1, 
             xlab = "", ylab = "Energy sub metering",
             type = "n")
        lines(datetime, sub_metering_1, col = "black")
        lines(datetime, sub_metering_2, col = "red")
        lines(datetime, sub_metering_3, col = "blue")
        
        legend("topright", col = c("black", "red", "blue"), pch = "_", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## Plot Global Reactive Power
        plot(datetime, global_reactive_power, ylab = "Global_reactive_power",
             type = "n")
        lines(datetime, global_reactive_power)
    })
    
    ## Close graphics device
    closeGraphicsDevice()
}

main()