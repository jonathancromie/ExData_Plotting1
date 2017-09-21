source("functions.R")

main <- function() {
    loadData()
    
    par(mfrow = c(1,1))
    png("plot3.png", width = 480, height = 480)
    
    datetime <- with(dataset, as.POSIXct(paste(date, time), format="%d/%m/%Y %H:%M:%S"))
    with(dataset, plot(datetime, sub_metering_1, 
                       xlab = "", ylab = "Energy sub metering",
                       type = "n"))
    
    with(dataset, lines(datetime, sub_metering_1, col = "black"))
    with(dataset, lines(datetime, sub_metering_2, col = "red"))
    with(dataset, lines(datetime, sub_metering_3, col = "blue"))
    
    legend("topright", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           cex = 1, lty = 1, xpd = TRUE)
    
    dev.off()
    
    # saveToPNG("plot3.png")
}

main()