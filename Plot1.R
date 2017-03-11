# Download the source zip file for the assignment

if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

# Read the unzipped file into R, using only the dates specified

files <- file('./data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Create the png file "Plot 1"
# Open file device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/Plot1.png', width = 480, height = 480, units='px')
# Create the plot 
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red'))
# Close connection to the file device
dev.off()
