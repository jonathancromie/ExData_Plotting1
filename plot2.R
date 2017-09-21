source("functions.R")

main <- function() {
    loadData()
    
    par(mfrow = c(1,1))
    
    datetime <- with(dataset, as.POSIXct(paste(date, time), format="%d/%m/%Y %H:%M:%S"))
    with(dataset, plot(datetime, global_active_power, 
                       xlab = "", ylab = "Global Active Power (kilowatts)",
                       type = "n"))
    
    lines(datetime, dataset$global_active_power)
    
    saveToPNG("plot2.png")
}

main()