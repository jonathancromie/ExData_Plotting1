source("functions.R")

main <- function() {
    loadData()
    
    par(mfrow = c(1,1))
    
    hist(dataset$global_active_power, col = "red", 
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    
    saveToPNG("plot1.png")
}

main()