#WEEK 1 PROJECt - Exploratory Data Analysis PLOT 1 


#Part 1 - PROCESSING RAW DATA
###
#Note that in this dataset missing values are coded as '?' 
#Read in csv as data frame; and limit to the dates gven in the project
#description: 2007-02-01 and 2007-02-02. 
#Create DateTime and formatted Data fields using strptime() and
#as.Date()  functions. Note that in the source csv, 'Date' string 
# sequenced dd/mm/YYYY.
#Keep the original form of the data as 'household_power_consumption.raw' for reference.
household_power_consumption.raw <- read.csv("~/Data Science Training/Coursera/Data Science Specialization/Course 4 - Exploratory Data Analysis/Week 1/Data/household_power_consumption.txt", sep=";")
household_power_consumption.raw <-household_power_consumption.raw[household_power_consumption.raw$Date=="1/2/2007" | household_power_consumption.raw$Date=="2/2/2007",] 
nrow(household_power_consumption.raw)
View(household_power_consumption.raw)
names(household_power_consumption.raw)

household_power_consumption<-household_power_consumption.raw

#Create a DateTime field from 2 the character sting 
# fields 'Date' and Time'
household_power_consumption$DateTime<-strptime(as.character(paste(as.character(household_power_consumption$Date),as.character(household_power_consumption$Time))), format="%d/%m/%Y %H:%M:%S")
household_power_consumption$DateTime[1:5]
#class(household_power_consumption$DateTime) #Should be class "POSIXlt" "POSIXt" 

#convert 'Date' field from char to Date format 
household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption$Date[1:5]
#class(household_power_consumption$Date) #Should be class "Date"

#Part 2 BUILD, PRINT and SAVE .bmp file of PLOT 1
###
par(mfrow=c(1,1))
hist(as.numeric(household_power_consumption$Global_active_power)/500,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,"plot1.png")
dev.off() #always turn the device OFF.
### END OF PROGRAM