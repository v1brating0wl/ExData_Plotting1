#-----------------------------------------------------------------------------------#
#                        Exploratory Data Analysis - plot2                          #
#                                                                                   #
# Programmed by:  Caroline Buckner                                                  #
# Programmed for: Exploratroy Data Analysis - Coursera                              #
# Date:           10 April 2015                                                     #
# Date modified:  -- April 2015                                                     #
#-----------------------------------------------------------------------------------#
# Description:                                                                      #
#     Program reads in a specified data file. The relevant rows are identified.     #
#     The kW over the 2 day period are plotted against time, with the x axis        #
#     indicating the day of occurance.                                              #
#     Uses base plotting.                                                           #
#-----------------------------------------------------------------------------------#


plot2<-function(){
    
    #-------------------------------------------------------------------------------#
    #  Reading in data.                                                             #
    #-------------------------------------------------------------------------------#
    
    data<-read.table("household_power_consumption.txt",    # Read in table, where:
                     header = TRUE, sep = ";",             # there are headers, entries are 
                     na.strings = "?",                     # separated by ';', missing
                     stringsAsFactors =FALSE)              # values are indicated by '?',         
                                                           # and columns are not coerced 
                                                           # to factors
    
    #-------------------------------------------------------------------------------#
    #  Cleaning.                                                                    #
    #-------------------------------------------------------------------------------#
    
    
    data1<-data[66637:69516,]                              # Manipulate only these rows    
    pasted<-paste(data1[,1],data1[,2])                     # Create DateTime 
    days<-c("Thu","Fri","Sat")                             # Weekday names
    
    data2<-cbind(pasted,data1[,3])                         # Create matrix DateTime and kW
    data2<-na.omit(data2)                                  # Remove incomplete entries
    
    
    #-------------------------------------------------------------------------------#
    #  Create plot.                                                                 #
    #-------------------------------------------------------------------------------#
    
    png(file="plot2.png", width = 480, height = 480)       # Create png to specification    
    
    
    plot(as.numeric(data2[,2]),type="l",xaxt="n",xlab="",  # Plot kW as a line plot against
         ylab="Global Active Power (kilowatts)");          # a generic x axis. No label on
                                                           # x axis. Appropriate name on y axis
    axis(1, at = c(0,1440,2880), labels = days,            # Create x axis labels for days of week
         tick = TRUE)                                      # as appropriate
    
                
    dev.off()                                             # Close device. Save file.
    
    
}