source("functions.R")

main <- function() {
    # Load data into program
    loadData()
    
    ## Switch graphics device to png
    launchGraphicsDevice(name = "plot2.png")
    
    ## Create plot
    datetime <- with(dataset, as.POSIXct(paste(date, time), format="%d/%m/%Y %H:%M:%S"))
    with(dataset, plot(datetime, global_active_power, 
                       xlab = "", ylab = "Global Active Power (kilowatts)",
                       type = "n"))
    lines(datetime, dataset$global_active_power)
    
    ## Close graphics device
    closeGraphicsDevice()
}

main()