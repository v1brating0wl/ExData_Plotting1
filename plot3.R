#-----------------------------------------------------------------------------------#
#                        Exploratory Data Analysis - plot3                          #
#                                                                                   #
# Programmed by:  Caroline Buckner                                                  #
# Programmed for: Exploratroy Data Analysis - Coursera                              #
# Date:           10 April 2015                                                     #
# Date modified:  -- April 2015                                                     #
#-----------------------------------------------------------------------------------#
# Description:                                                                      #
#     Program reads in a specified data file. The relevant rows are identified.     #
#     The three sets of data are plotted on the same set of axes.                   #
#     Uses base plotting.                                                           #
#-----------------------------------------------------------------------------------#


plot3<-function(){
    
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
    #  NOTE: I know that I could have been more efficient, but opted for explicit.  #
    #-------------------------------------------------------------------------------#
    
    
    data1<-data[66637:69516,]                              # Manipulate only these rows    
    pasted<-paste(data1[,1],data1[,2])                     # Create DateTime 
    days<-c("Thu","Fri","Sat")                             # Weekday names
    
    data2<-cbind(pasted,data1[,7])                         # Create matrix DateTime and SM1
    data2<-na.omit(data2)                                  # Remove incomplete entries
    
    data3<-cbind(pasted,data1[,8])                         # Create matrix DateTime and SM2
    data3<-na.omit(data3)                                  # Remove incomplete entries
    
    data4<-cbind(pasted,data1[,9])                         # Create matrix DateTime and SM3
    data4<-na.omit(data4)                                  # Remove incomplete entries
    
    #-------------------------------------------------------------------------------#
    #  Create plot.                                                                 #
    #-------------------------------------------------------------------------------#
    
    png(file="plot3.png", width = 480, height = 480)       # Create png to specification    
    
    
    plot(data2[,2],type="n",ylab="Energy sub metering",    # Init plotting area with y label
         xlab="",xaxt="n")                                 # Print nothing in the plotting 
                                                           # area
   
    
    lines(data2[,2],type="l",xaxt="n",                     # Add the first set of data to 
          ylab="Energy sub metering",col="black",xlab="")  # the plot space with appropriate 
                                                           # color.
   
   
    par(new=TRUE)                                          # Ensure cont plotting in init space.
    lines(data4[,2],type="l",xaxt="n",xlab="",             # Add the second set of data to
         ylab="Energy sub metering",col="blue")            # the plot space with appropriate
                                                           # color.
    
    
    par(new=TRUE)                                          # Ensure cont plotting in init space.
    lines(data3[,2],type="l",xaxt="n",                     # Add final set of data to the plot
          ylab="Energy sub metering",xlab="",col="red")    # space with appropriate color.
   
   axis(1, at = c(0,1440,2880), labels = days,            # Create x axis labels for days of week
        tick = TRUE)                                      # as appropriate
    
   legend("topright",                                     # Create legend in top right corner
          legend=c("Sub_metering_1","Sub_metering_2",     # with specified formatting
                   "Sub_metering_3"), pch="_",
          col=c("black","red","blue"))
   
   
   dev.off()                                             # Close device. Save file.
    
    
}