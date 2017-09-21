source("functions.R")

main <- function() {
    # Load data into program
    loadData()
    
    ## Switch graphics device to png
    launchGraphicsDevice(name = "plot1.png")
    
    ## Create histogram
    hist(dataset$global_active_power, col = "red", 
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    
    ## Close graphics device
    closeGraphicsDevice()
}

main()