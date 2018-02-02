
# classes to represent Dates and Times
# Date class
# Date stored as the number of days since 1970 - 01 - 01
# Date stored as the number of days since 1970 - 01 - 01

xxxxx <- as.Date ("1970-01-01")
unclass (xxxxx) # [1] 0
unclass(as.Date("1970-01-02") # [1] 1 >> 1 day after 1970-01-01
        
        
        
 # POSIXct & POSIXlt classes
 # Time is stored as the number of seconds since 1970 - 01 - 01
        
 # POSIXct are standards in computer for timing
 # ct : integer  / lt : list "other information"
        
 # weekdays / months / quarters functions give info
 
 xxxxx <- Sys.time()
 xxxxx                   # [1] "2018-01-28 14:09:30 EET"
 p <- as.POSIXct(xxxxx)
 p                       # [1] "2018-01-28 14:09:30 EET"
 unclass (p)             # [1] 1517141370 >> number of seconds since the fixed date 1970-01-01
 names (unclass(p))      # NULL
 p$sec                   # Error in p$sec : $ operator is invalid for atomic vectors
 p <- as.POSIXlt(xxxxx)
 unclass(p)              # $sec  [1] 30.0209 >> nmber of seconds since xxxxx
 #  $min  [1] 9
 # $hour [1] 14
 # $mday [1] 28
 # $mon [1] 0
 # $year [1] 118
 # $wday [1] 0
 # $yday [1] 27
 # $isdst [1] 0
 # $zone [1] "EET"
 # $gmtoff [1] 7200
 # attr(,"tzone") [1] ""    "EET" "EET"
 names(unclass(p)) 
 # [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"   "isdst" 
 # [10] "zone"   "gmtoff"
 p$sec # [1] 40.96018 >> seconds at the captured time 
 
 datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
 x <- strptime(datestring, "%B %d, %Y %H:%M") #B: month   M: minute 
 x # [1] NA NA BUT supposed to give ## [1] "2012-01-10 10:40:00 EST" "2011-12-09 09:10:00 EST"
 class(x) # [1] "POSIXlt" "POSIXt"
 
 #operations on date and time
 
 x <- as.Date("2012-01-01")
 y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
 x
 y # [1] NA
 x-y # warning : Date class and time class : different classes
 
 x <- as.POSIXlt(x)
 x-y
 
# NA problem
 Sys.getlocale("LC_TIME") # [1] "ar_EG.UTF-8"
# Sys.setlocale("LC_ALL","English") ## didn't work
 Sys.setlocale("LC_ALL", 'en_US.UTF-8') 
 # Sys.setenv(LANG = "en_US.UTF-8")
 x <- strptime("1 10, 2012 10:40", format = "%B %d, %Y %H:%M") # [1] NA
 x <- strptime(" 1/2/2012 10:40", format = "%d/%m/%Y %H:%M") # [1] "2012-02-01 10:40:00 EET"
 # be wary of the names
 # when I used:
 format(ISOdate(2004,1:12,1),"%B")
 # [1] "January"   "February"  "March"     "April"     "May"       "June"      "July"     
 # [8] "August"    "September" "October"   "November"  "December" 
 
 