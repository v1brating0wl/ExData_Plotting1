#-----------------------------------------------------------------------------------#
#                        Exploratory Data Analysis - plot1                          #
#                                                                                   #
# Programmed by:  Caroline Buckner                                                  #
# Programmed for: Exploratroy Data Analysis - Coursera                              #
# Date:           09 April 2015                                                     #
# Date modified:  10 April 2015                                                     #
#-----------------------------------------------------------------------------------#
# Description:                                                                      #
#     Program reads in a specified data file. The relevant rows are identified.     #
#     A histogram of the kW data is created and saved to png.                       #
#     Uses base plotting.                                                           #
#-----------------------------------------------------------------------------------#


plot1<-function(){
    
    #-------------------------------------------------------------------------------#
    #  Reading in data.                                                             #
    #-------------------------------------------------------------------------------#
    
    data<-read.table("household_power_consumption.txt",    # Read in table, where:
                     header = TRUE, sep = ";",             # there are headers, entries are 
                     na.strings = "?")                     # separated by ';', and missing 
                                                           # values are indicated by '?'
                                                                     
    data1<-data[66637:69516,]                              # Manipulate only these rows    
    
    #-------------------------------------------------------------------------------#
    #  Create plot.                                                                 #
    #-------------------------------------------------------------------------------#
    png(file="plot1.png", width = 480, height = 480)       # Create png to specification    
    
    hist(data1[,3],col="orangered",                        # Create a histogram of the 
         main="Global Active Power",                       # Global Active Power (col 3)
         xlab="Global Active Power (kilowatts)")           # Set fill color, plot title, 
                                                           # and axes names as appropriate
    
     dev.off()                                             # Close device. Save file.


}