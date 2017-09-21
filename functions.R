### The point of this file is to not have to copy and paste the following 
### functions into each and every plot script. This way this file can just be 
### sourced into each script and the functions can be called when needed

## Load the data from household_power_consumption.txt and store it as a 
## dataframe.
loadData <- function() {
    if (!exists("dataset")) {
        ## Read data in from text file
        dataset <- read.table("data/household_power_consumption.txt", 
                              header = TRUE, sep = ";", na.strings = "?")
        
        ## Change column names to preferred lower case
        names(dataset) <- tolower(names(dataset))
        
        ## Subset the dates between 2007-02-01 and 2007-02-02
        dataset <<- subset(dataset, date == '1/2/2007' | date == '2/2/2007')
    }
}

## Launch the png graphics device.
## @param name The name of the file, i.e. plot1.png, plot2.png, etc.
launchGraphicsDevice <- function(name) {
    if (file.exists(name)) {
        stop("File already exists. Please delete and try again")
    }
    png(name, width = 480, height = 480)
}

## Closes the graphics device, saving the png file to the working directory
closeGraphicsDevice <- function() {
    dev.off()
}

