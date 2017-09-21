### The point of this file is to not have to copy and paste the following 
### functions into each and every plot script. This way this file can just be 
### sourced into each script and the functions can be called when needed
loadData <- function() {
    if (!exists("dataset")) {
        ## Read data in from text file
        dataset <- read.table("data/household_power_consumption.txt", 
                              header = TRUE, sep = ";", na.strings = "?")
        
        ## Change column names to preferred lower case
        names(dataset) <- tolower(names(dataset))
        
        ## Convert date to POSIXlt. 
        # dataset$date <- as.Date(dataset$date, "%d/%m/%Y")
        # dataset$datetime <- with(dataset, as.POSIXct(paste(date, time), format="%d/%m/%Y %H:%M:%S"))
        
        
        ## Subset the dates between 2007-02-01 and 2007-02-02
        dataset <<- subset(dataset, date == '1/2/2007' | date == '2/2/2007')
    }
}

saveToPNG <- function(name) {
    if (file.exists(name)) {
        stop("File already exists. Please delete and try again")
    }
    # dev.copy(png, file = name)
    # png(name, width = 480, height = 480, type = "quartz")
    # par(bg = "transparent")
    dev.copy(png, file = name)
    dev.off()
}

